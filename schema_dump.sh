./db/reset.sh

npm run postgraphql -- --export-schema-graphql schema/v3-schema.graphql &
PID=$!
sleep 2
kill $PID
wait

npm run postgraphile -- --export-schema-graphql schema/v4-schema.graphql &
PID=$!
sleep 2
kill $PID
wait

./schema/sort-schema.js schema/v3-schema.graphql > schema/v3-schema.sorted.graphql
./schema/sort-schema.js schema/v4-schema.graphql > schema/v4-schema.sorted.graphql
diff -ur schema/v3-schema.sorted.graphql schema/v4-schema.sorted.graphql > schema/schema.graphql.diff
