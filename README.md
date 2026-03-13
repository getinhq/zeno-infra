# zeno-infra

Docker Compose and env for local Zeno development: Postgres, MongoDB, Redis, MinIO (CAS).

## One-command dev

```bash
cp .env.example .env   # edit if needed
docker compose up -d
```

- **With MinIO (S3 for CAS):** `docker compose --profile full up -d`. Create bucket `zeno-cas` in MinIO console (http://localhost:9001) or via API; then set `S3_ENDPOINT_URL`, `S3_ACCESS_KEY`, `S3_SECRET_KEY`, `S3_BUCKET_CAS` in zeno-api `.env`.

Then run **zeno-api** and **zeno-dashboard** from their repos (see [zeno-repos README](../README.md)).

## Repos

- [zeno-api](../zeno-api) — API (connect with `DATABASE_URL`, `REDIS_URL`, `S3_*` from `.env`)
- [zeno-dashboard](../zeno-dashboard) — Dashboard
- [zeno-plugin](../zeno-plugin) — DCC plugins
- [Tech stack (DECISION_LOG)](../zeno-api/docs/DECISION_LOG.md)
