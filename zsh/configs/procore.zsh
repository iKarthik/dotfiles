alias qa="pbpaste | perl -p -e 's/\n/ /' | sed 's/^/EXPLAIN (ANALYZE, COSTS, VERBOSE, BUFFERS, FORMAT JSON) /' | psql -qAt procore_development | gocmdpev"
