# zeno-infra

Docker Compose and env for local Zeno development: Postgres, MongoDB, Redis, MinIO (CAS).

## One-command dev

```bash
cp .env.example .env   # edit if needed
docker compose up -d
```

### Full stack (MinIO + automatic `zeno-cas` bucket)

```bash
docker compose --profile full up -d --build
```

Add to **this directory’s** `.env` (or export) so the `api` service uses S3 CAS against MinIO:

```env
S3_ENDPOINT_URL=http://minio:9000
S3_ACCESS_KEY=minioadmin
S3_SECRET_KEY=minioadmin
S3_BUCKET_CAS=zeno-cas
CAS_STORAGE_BACKEND=auto
```

The `minio-setup` service creates bucket `zeno-cas` when the `full` profile is active.

Then run **zeno-api** and **zeno-dashboard** from their repos (see [zeno-repos README](../README.md)).

### Seed sample project (`ndfc`)

With the stack up:

```bash
docker compose exec api python -m scripts.seed_ndfc
```

## Repos

- [zeno-api](../zeno-api) — API (connect with `DATABASE_URL`, `REDIS_URL`, `S3_*` from `.env`)
- [zeno-dashboard](../zeno-dashboard) — Dashboard
- [zeno-plugin](../zeno-plugin) — DCC plugins
- [Tech stack (DECISION_LOG)](../zeno-api/docs/DECISION_LOG.md)
