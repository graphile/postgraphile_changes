insert into forum_example.person (id, first_name, last_name, created_at)
  select
    i as id,
    (case i % 7 when 0 then 'Alice' when 1 then 'Bob' when 2 then 'Caroline' when 3 then 'Dave' when 4 then 'Emily' when 5 then 'Fred' when 6 then 'Georgina' end) as first_name,
    'Family' || floor(i / 7.0) as last_name,
    '1970-01-01'::timestamptz + i * interval '1 hour' as created_at
  from generate_series(1000, 10000) as i;

alter sequence forum_example.person_id_seq restart with 1000000;

insert into forum_example_private.person_account (person_id, email, password_hash)
  select
    i as person_id,
    'user' || i || '@example.com' as email,
    '$2a$10$YZ10ljXKA2pghyVgy2rSG.aNQyD9AZu262HiTUGr9vzZeR.LoB2Ry' as password_hash -- 'postgraphile'
  from generate_series(1000, 10000) as i;

insert into forum_example.thread (id, author_id, title, created_at)
  select
    i as id,
    1000 + (i % 9000) as author_id,
    'Thread ' || i as title,
    '1980-01-01'::timestamptz + i * interval '1 hour' as created_at
  from generate_series(1000, 50000) as i;

alter sequence forum_example.thread_id_seq restart with 1000000;

insert into forum_example.post (thread_id, author_id, headline, body, created_at)
  select
    thread_id as thread_id,
    1000 + ((thread_id * 100 + post_number) % 9000) as author_id,
    '#' || post_number || ' in thread ' || thread_id as headline,
    repeat('Repeating text. ', ((thread_id * 100 + post_number) * 13) % 101) as body,
    '1990-01-01'::timestamptz + (thread_id * 100 + post_number) * interval '1 minute' as created_at
  from
    generate_series(1000, 5000) as thread_id,
    generate_series(0, power(thread_id % 5, 3)::int) as post_number;

alter sequence forum_example.post_id_seq restart with 100000000;
