-- This is largely taken from https://github.com/graphile/postgraphile/blob/master/examples/forum/schema.sql

create schema forum_example;
create schema forum_example_private;

create table forum_example.person (
  id               serial primary key,
  first_name       text not null check (char_length(first_name) < 80),
  last_name        text check (char_length(last_name) < 80),
  about            text,
  created_at       timestamp default now()
);

comment on table forum_example.person is 'A user of the forum.';
comment on column forum_example.person.id is 'The primary unique identifier for the person.';
comment on column forum_example.person.first_name is 'The person’s first name.';
comment on column forum_example.person.last_name is 'The person’s last name.';
comment on column forum_example.person.about is 'A short description about the user, written by the user.';
comment on column forum_example.person.created_at is 'The time this person was created.';

create type forum_example.topic as enum (
  'discussion',
  'inspiration',
  'help',
  'showcase'
);

create table forum_example.thread (
  id               serial primary key,
  author_id        integer not null references forum_example.person(id),
  topic            forum_example.topic,
  title            text not null check (char_length(title) < 280),
  body             text,
  created_at       timestamp default now()
);

create index on forum_example.thread(author_id);


create table forum_example.post (
  id               serial primary key,
  thread_id        integer not null references forum_example.thread,
  author_id        integer not null references forum_example.person(id),
  headline         text not null check (char_length(headline) < 280),
  body             text,
  created_at       timestamp default now()
);
create index on forum_example.post(thread_id);
create index on forum_example.post(author_id);

comment on table forum_example.post is 'A forum post written by a user.';
comment on column forum_example.post.id is 'The primary key for the post.';
comment on column forum_example.post.headline is 'The title written by the user.';
comment on column forum_example.post.author_id is 'The id of the author user.';
comment on column forum_example.post.thread_id is 'The thread this has been posted in.';
comment on column forum_example.post.body is 'The main body text of our post.';
comment on column forum_example.post.created_at is 'The time this post was created.';

alter default privileges revoke execute on functions from public;

create function forum_example.thread_post_count(t forum_example.thread) returns bigint as $$
  select count(*) from forum_example.post where thread_id = t.id;
$$ language sql stable;

create function forum_example.person_full_name(person forum_example.person) returns text as $$
  select person.first_name || ' ' || person.last_name
$$ language sql stable;

comment on function forum_example.person_full_name(forum_example.person) is 'A person’s full name which is a concatenation of their first and last name.';

create function forum_example.post_summary(
  post forum_example.post,
  length int default 50,
  omission text default '…'
) returns text as $$
  select case
    when post.body is null then null
    else substr(post.body, 0, length) || omission
  end
$$ language sql stable;

comment on function forum_example.post_summary(forum_example.post, int, text) is 'A truncated version of the body for summaries.';

create function forum_example.person_latest_post(person forum_example.person) returns forum_example.post as $$
  select post.*
  from forum_example.post as post
  where post.author_id = person.id
  order by created_at desc
  limit 1
$$ language sql stable;

comment on function forum_example.person_latest_post(forum_example.person) is 'Gets the latest post written by the person.';

create function forum_example.search_posts(search text) returns setof forum_example.post as $$
  select post.*
  from forum_example.post as post
  where post.headline ilike ('%' || search || '%') or post.body ilike ('%' || search || '%')
$$ language sql stable;

comment on function forum_example.search_posts(text) is 'Returns posts containing a given search term.';

alter table forum_example.person add column updated_at timestamp default now();
alter table forum_example.post add column updated_at timestamp default now();

create function forum_example_private.set_updated_at() returns trigger as $$
begin
  new.updated_at := current_timestamp;
  return new;
end;
$$ language plpgsql;

create trigger person_updated_at before update
  on forum_example.person
  for each row
  execute procedure forum_example_private.set_updated_at();

create trigger post_updated_at before update
  on forum_example.post
  for each row
  execute procedure forum_example_private.set_updated_at();

create table forum_example_private.person_account (
  person_id        integer primary key references forum_example.person(id) on delete cascade,
  email            text not null unique check (email ~* '^.+@.+\..+$'),
  password_hash    text not null
);

comment on table forum_example_private.person_account is 'Private information about a person’s account.';
comment on column forum_example_private.person_account.person_id is 'The id of the person associated with this account.';
comment on column forum_example_private.person_account.email is 'The email address of the person.';
comment on column forum_example_private.person_account.password_hash is 'An opaque hash of the person’s password.';

create extension if not exists "pgcrypto";

create function forum_example.register_person(
  first_name text,
  last_name text,
  email text,
  password text
) returns forum_example.person as $$
declare
  person forum_example.person;
begin
  insert into forum_example.person (first_name, last_name) values
    (first_name, last_name)
    returning * into person;

  insert into forum_example_private.person_account (person_id, email, password_hash) values
    (person.id, email, crypt(password, gen_salt('bf')));

  return person;
end;
$$ language plpgsql strict security definer;

comment on function forum_example.register_person(text, text, text, text) is 'Registers a single user and creates an account in our forum.';

create role forum_example_postgraphile login password 'xyz';

create role forum_example_anonymous;
grant forum_example_anonymous to forum_example_postgraphile;

create role forum_example_person;
grant forum_example_person to forum_example_postgraphile;

create type forum_example.jwt_token as (
  role text,
  person_id integer
);

create function forum_example.authenticate(
  email text,
  password text
) returns forum_example.jwt_token as $$
declare
  account forum_example_private.person_account;
begin
  select a.* into account
  from forum_example_private.person_account as a
  where a.email = $1;

  if account.password_hash = crypt(password, account.password_hash) then
    return ('forum_example_person', account.person_id)::forum_example.jwt_token;
  else
    return null;
  end if;
end;
$$ language plpgsql strict security definer;

comment on function forum_example.authenticate(text, text) is 'Creates a JWT token that will securely identify a person and give them certain permissions.';

create function forum_example.current_person() returns forum_example.person as $$
  select *
  from forum_example.person
  where id = current_setting('jwt.claims.person_id')::integer
$$ language sql stable;

comment on function forum_example.current_person() is 'Gets the person who was identified by our JWT.';

grant usage on schema forum_example to forum_example_anonymous, forum_example_person;

grant select on table forum_example.person to forum_example_anonymous, forum_example_person;
grant update, delete on table forum_example.person to forum_example_person;

grant select on table forum_example.post to forum_example_anonymous, forum_example_person;
grant insert, update, delete on table forum_example.post to forum_example_person;
grant usage on sequence forum_example.post_id_seq to forum_example_person;

grant execute on function forum_example.person_full_name(forum_example.person) to forum_example_anonymous, forum_example_person;
grant execute on function forum_example.post_summary(forum_example.post, integer, text) to forum_example_anonymous, forum_example_person;
grant execute on function forum_example.person_latest_post(forum_example.person) to forum_example_anonymous, forum_example_person;
grant execute on function forum_example.search_posts(text) to forum_example_anonymous, forum_example_person;
grant execute on function forum_example.authenticate(text, text) to forum_example_anonymous, forum_example_person;
grant execute on function forum_example.current_person() to forum_example_anonymous, forum_example_person;

grant execute on function forum_example.register_person(text, text, text, text) to forum_example_anonymous;

alter table forum_example.person enable row level security;
alter table forum_example.post enable row level security;

create policy select_person on forum_example.person for select
  using (true);

create policy select_post on forum_example.post for select
  using (true);

create policy update_person on forum_example.person for update to forum_example_person
  using (id = current_setting('jwt.claims.person_id')::integer);

create policy delete_person on forum_example.person for delete to forum_example_person
  using (id = current_setting('jwt.claims.person_id')::integer);

create policy insert_post on forum_example.post for insert to forum_example_person
  with check (author_id = current_setting('jwt.claims.person_id')::integer);

create policy update_post on forum_example.post for update to forum_example_person
  using (author_id = current_setting('jwt.claims.person_id')::integer);

create policy delete_post on forum_example.post for delete to forum_example_person
  using (author_id = current_setting('jwt.claims.person_id')::integer);

create table forum_example_private.thread_stats (
  thread_id int not null primary key references forum_example.thread,
  post_count int not null default 0
);

create function forum_example_private.change_thread_count() returns trigger as $$
begin
  if tg_op = 'DELETE' then
    update forum_example_private.thread_stats set post_count = post_count - 1 where thread_id = old.thread_id;
    return old;
  else
    update forum_example_private.thread_stats set post_count = post_count + 1 where thread_id = new.thread_id;
    return new;
  end if;
end;
$$ language plpgsql;

create trigger change_count after insert or delete on forum_example.post for each row execute procedure forum_example_private.change_thread_count();

create function forum_example.popular_threads() returns setof forum_example.thread as $$
  select thread.* from forum_example.thread inner join forum_example_private.thread_stats on (thread_stats.thread_id = thread.id) order by post_count desc;
$$ language sql stable;

create table forum_example.emoji (
  alias varchar(100) not null primary key,
  url text not null
);

alter table forum_example.emoji enable row level security;
create policy select_all on forum_example.emoji for select using (true);
grant select on forum_example.emoji to forum_example_person;

create table forum_example.post_emoji (
  post_id int not null references forum_example.post on delete cascade,
  person_id int not null default current_setting('jwt.claims.person_id')::integer references forum_example.person on delete cascade,
  emoji_alias varchar(100) not null references forum_example.emoji on delete cascade,
  created_at timestamp not null default now(),
  primary key (post_id, person_id, emoji_alias)
);

create index on forum_example.post_emoji(person_id);
create index on forum_example.post_emoji(emoji_alias);
create index on forum_example.post_emoji(created_at);

alter table forum_example.post_emoji enable row level security;
create policy select_all on forum_example.post_emoji for select using (true);
grant select on forum_example.post_emoji to forum_example_person;
create policy insert_all on forum_example.post_emoji for insert with check (person_id = current_setting('jwt.claims.person_id')::int);
grant insert (post_id, emoji_alias) on forum_example.post_emoji to forum_example_person;
create policy delete_all on forum_example.post_emoji for delete using (person_id = current_setting('jwt.claims.person_id')::int);
grant delete on forum_example.post_emoji to forum_example_person;

create function forum_example.post_emoji_summary(p forum_example.post) returns json as $$
  select json_agg(o.o) from (
    select json_build_object('alias', emoji_alias, 'count', count(*)) o
    from forum_example.post_emoji
    where post_emoji.post_id = p.id
    group by post_emoji.emoji_alias
    order by count(*) desc, emoji_alias asc
    limit 20
  ) o;
$$ language sql stable;
