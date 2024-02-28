export GIN_MODE=“debug”
export SQL_DSN="root:root@tcp(localhost:3306)/oneapi"
export set REDIS_CONN_STRING="redis://:jifeng123Redis@127.0.0.1:8867/3"
export  SYNC_FREQUENCY=1800
./one-api  --port 3000 --log-dir ./logs