set -e -x
dropdb --if-exists postgraphile_changes
createdb postgraphile_changes
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
psql -X -1 -v ON_ERROR_STOP=1 postgraphile_changes < $DIR/drop.sql
psql -X -1 -v ON_ERROR_STOP=1 postgraphile_changes < $DIR/schema.sql
psql -X -1 -v ON_ERROR_STOP=1 postgraphile_changes < $DIR/data.sql
