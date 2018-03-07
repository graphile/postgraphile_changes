
  select to_json(json_build_array(__local_0__."id")) as "__identifiers", to_json((__local_0__."id")) as "id", to_json((__local_0__."title")) as "title", to_json((
  select json_build_object('__identifiers', json_build_array(__local_1__."id"), 'id', (__local_1__."id"), 'fullName', (
  select to_json(__local_2__.__local_2__) as "value"
  from "forum_example"."person_full_name"(__local_1__) as __local_2__

  where (TRUE) and (TRUE)



), 'about', (__local_1__."about"), 'createdAt', (__local_1__."created_at"), 'posts', ( select json_build_object('totalCount', (
  select count(*)
  from "forum_example"."post" as __local_3__
  where (__local_3__."author_id" = __local_1__."id")
)) )) as object
  from "forum_example"."person" as __local_1__

  where (__local_0__."author_id" = __local_1__."id") and (TRUE) and (TRUE)



)) as "author", to_json((
  select to_json((__local_4__.__local_4__)::text) as "value"
  from "forum_example"."thread_post_count"(__local_0__) as __local_4__

  where (TRUE) and (TRUE)



)) as "postCount", to_json((with __local_5__ as (
  select to_json(json_build_array(__local_6__."id")) as "__identifiers", to_json((__local_6__."id")) as "id", to_json((__local_6__."author_id")) as "authorId", to_json((__local_6__."headline")) as "headline", to_json((__local_6__."body")) as "body", to_json((__local_6__."created_at")) as "createdAt", to_json((
  select json_build_object('__identifiers', json_build_array(__local_7__."id"), 'id', (__local_7__."id"), 'fullName', (
  select to_json(__local_8__.__local_8__) as "value"
  from "forum_example"."person_full_name"(__local_7__) as __local_8__

  where (TRUE) and (TRUE)



), 'about', (__local_7__."about"), 'createdAt', (__local_7__."created_at"), 'posts', ( select json_build_object('totalCount', (
  select count(*)
  from "forum_example"."post" as __local_9__
  where (__local_9__."author_id" = __local_7__."id")
)) )) as object
  from "forum_example"."person" as __local_7__

  where (__local_6__."author_id" = __local_7__."id") and (TRUE) and (TRUE)



)) as "author", to_json((with __local_10__ as (
  select to_json((
  select json_build_object('id', (__local_11__."id"), 'fullName', (
  select to_json(__local_12__.__local_12__) as "value"
  from "forum_example"."person_full_name"(__local_11__) as __local_12__

  where (TRUE) and (TRUE)



)) as object
  from "forum_example"."person" as __local_11__

  where (__local_13__."person_id" = __local_11__."id") and (TRUE) and (TRUE)



)) as "person", to_json((
  select json_build_object('alias', (__local_14__."alias"), 'url', (__local_14__."url")) as object
  from "forum_example"."emoji" as __local_14__

  where (__local_13__."emoji_alias" = __local_14__."alias") and (TRUE) and (TRUE)



)) as "emoji"
  from "forum_example"."post_emoji" as __local_13__

  where (__local_13__."post_id" = __local_6__."id") and (TRUE) and (TRUE)
  order by __local_13__."created_at" DESC,__local_13__."post_id" ASC,__local_13__."person_id" ASC,__local_13__."emoji_alias" ASC
  limit 100

), __local_15__ as (select json_agg(to_json(__local_10__)) as data from __local_10__) select json_build_object('data', coalesce((select __local_15__.data from __local_15__), '[]'::json)) )) as "emojiLink"
  from "forum_example"."post" as __local_6__

  where (__local_6__."thread_id" = __local_0__."id") and (TRUE) and (TRUE)
  order by __local_6__."id" ASC
  limit 20

), __local_16__ as (select json_agg(to_json(__local_5__)) as data from __local_5__) select json_build_object('data', coalesce((select __local_16__.data from __local_16__), '[]'::json)) )) as "posts"
  from "forum_example"."thread" as __local_0__

  where (__local_0__."id" = 1004) and (TRUE) and (TRUE);
