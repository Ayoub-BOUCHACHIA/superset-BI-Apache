/usr/bin/wait-for-it db:5432 -- echo "DB is up" && 
/usr/bin/wait-for-it redis:6379 -- echo "Redis is up" && 
superset db upgrade && 
superset init && 
superset run -p 8088 --with-threads --reload --debugger

