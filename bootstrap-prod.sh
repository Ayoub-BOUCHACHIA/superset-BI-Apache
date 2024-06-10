/usr/bin/wait-for-it db:5432 -- echo "DB is up" &&
/usr/bin/wait-for-it redis:6379 -- echo "Redis is up" &&
superset db upgrade &&
superset init && 
gunicorn -w 2 -k gevent --timeout 120 -b  0.0.0.0:8088 "superset.app:create_app()"