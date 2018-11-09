# Development Database
development: &pgsql
  adapter: postgresql
  database: {{MSF_DB_DEV_NAME}}
  username: {{MSF_DB_USER}}
  password: {{MSF_DB_PASSWD}}
  host: localhost
  port: 5432
  pool: 5
  timeout: 5

# Production database -- same as dev
production: &production
  <<: *pgsql

# Test database -- not the same, since it gets dropped all the time
test:
  <<: *pgsql
  database: {{MSF_DB_TEST_NAME}}