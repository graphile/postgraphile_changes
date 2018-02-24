# New Features

Though the entry point to v4 is almost identical to v3 (with a few additional options!), the guts of PostGraphile have been re-written from the ground up - about 80% of the codebase has been replaced with smaller dependencies in the form of our new plugin-base schema generator.

## Plugins plugins plugins

The GraphQL schema the PostGraphile generates (and even the introspection it performs on the database!) is now constructed out of a number of `graphile-build` plugins. `graphile-build` was invented for PostGraphile (though it is also suitable for use in other GraphQL projects) to enable easy extensibility of the core system. This means we can now have community led experiments such as [postgraphile-plugin-connection-filter](https://github.com/mattbretl/postgraphile-plugin-connection-filter) which adds a much more powerful filter engine to PostGraphile that the built in `condition` argument.

It's also possible to turn off, or even replace, built in plugins - and of course to add your own. So you can really customise PostGraphile now!

Be warned though, writing a plugin is a fair undertaking right now - it's going to take a while for the right interfaces and helpers to appear, so right now you're wrestling with the raw API which can be pretty knarly!

## Order! Order!

Connections now support ordering by an array of columns rather than just one.

## Performance: goodbye N+1 queries!

The performance of PostGraphile has massively increased over PostGraphQL v3; and the memory usage has decreased too! If you run your database and PostGraphile on different servers then you should find query times are improved even further by the (significant!) reduction in the number of SQL queries that we generate.

## Column-level SELECT grants may now work

As part of the performance work, we now select only the fields we need (and we also inline computed columns, in case you're interested!). As such, if you have column-level SELECT grants you may find that this works with PostGraphile now. Note, however, that I do not recommend using these - instead I recommend splitting your concerns into multiple tables and use the one-to-one relationship feature to link them.

## One-to-one relationships

If you have tables like this:

```sql
create table foo (
  id serial primary key
);

create table bar (
  foo_id int not null primary key references foo,
  name text
);
```

in V3 you would have a schema like:

```graphql
type Foo {
  id: Int!

  # This next field is annoying - you'll only ever get 0
  # or 1 records giving a connection makes accessing it
  # too indirect.
  barsByFooId: BarsConnection!
}

type Bar {
  fooId: Int!
  name: String
  fooByFooId: Foo
}
```

which you have to query like:

```graphql
{
  fooById(id: 1) {
    barsByFooId {
      edges {
        node {
          name
        }
      }
    }
  }
}
```

with this change you'd get the following schema instead:

```graphql
type Foo {
  id: Int!
  barByFooId: Bar
}

type Bar {
  fooId: Int!
  name: String
  fooByFooId: Foo
}
```

which you have to query like:

```graphql
{
  fooById(id: 1) {
    barByFooId {
      name
    }
  }
}
```

No more unnecessary indirection!

Don't worry though, we still have the old relation too, we've just deprecated it.

## Cache invalidation (Serverless)

People have been running PostGraphile on AWS Lambda and similar environments, and one of the common issues that I hear is that boot up time is too slow. V4 addresses this in two ways: 

1. we offer the `--read-cache` and `--write-cache` options that allow plugins (including the introspection plugin!) to cache work that they do up front - note that we do *not* handle invalidating this cache, so that remains your responsibility.
2. by changing the minimum requirements of PostGraphile to Node.js 8.6 we can make use of native async/await support, resulting in much less code for Node to parse and execute.

If you want to improve things even further, you should consider bundling your server dependencies into one JS file with something like `webpack` so that Node spends less time looking at the filesystem!

## Naming things

You no longer have to trust us to come up with the best names for your fields. You can override all the names by supplying your own inflector. The interface around this is still coming to fruition, but the functionality is there!

https://github.com/graphile/graphile-build/blob/master/packages/graphile-build-pg/src/inflections.js

## Better support, better errors

- Many previously invalid enums are now made valid
- When the introspection results in an empty name, an error is thrown explaining why
- Support `point` type
- When a name clashes for some reason, an error is thrown detailing what the field was, and on what type it is.
- When you specify `--schema` and that schema doesn't exist, you will be warned
- Tables that end in `_input` or `_patch` are renamed to FooInputRecord or similar to avoid clashes with mutation types on other tables

## Deprecation / smart comments

It's now possible to deprecate fields, tables, functions, etc by adding a "smart comment"; e.g.

```sql
comment on column c.person.site is '@deprecated Use `website` instead\nThe user''s homepage';
```

Smart comments (known internally as `tags`) are not well documented yet, and they currently only support the `deprecated` feature; however we will be adding more and more smart comments as time passes, they might be used to do things such as hiding columns from GraphQL,overriding the names of things in GraphQL, and much more. If you're interested in helping out here (or just making suggestion!) please check this out:

https://github.com/graphile/graphile-build/blob/master/packages/graphile-build-pg/__tests__/tags.test.js

And file an issue!

## pg@@7.x and duck-typed pg

In v3 it was quite common to have conflicts with `pg` - where you had your own version installed, and PostGraphile installed it's version, and when you passed a pgPool over to PostGraphile it would throw an error. Well no more! We now look at the pgPool you've handed us and if it quacks like ~~a duck~~ `pg.Pool` then we'll trust you and treat it as a pgPool.


## Lots of hidden features

There's absolutely loads of things going on under the hood that we've not officially exposed yet. You can use some of this goodness (e.g. `pgColumnFilter`) by tapping into the `graphileBuildOptions` setting, but you'll currently have to go digging to see what they are and how they work.

## General fixes

- edges on mutations now actually provide a cursor
