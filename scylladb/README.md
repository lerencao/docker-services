### Scylla DB in Docker ###

1. Create scylla data dirs：

```
data/
├── scylla1
│   ├── commitlog
│   └── data
├── scylla2
│   ├── commitlog
│   └── data
└── scylla3
    ├── commitlog
    └── data
```

2. Then run `docker-compose up -d` to start three scylla server named: scylla1, scylla2, scylla3.

#### Be careful of ... ####

- data dir should be created before run docker-compose.
- Seeds cannot be dns entry like `scylla1`, it must be ip, so the docker-compose file use static address.
- Scylla runs in development mode, if disabled, it can not run properly due to the lack of resource.

See [docker-scylla](https://hub.docker.com/r/scylladb/scylla/) for more details.
