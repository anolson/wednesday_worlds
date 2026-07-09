## Wednesday Worlds

This is the Rails web application that runs https://wednesdayworlds.org

### Download the source

```
$ git clone git://github.com/anolson/wednesday_worlds.git
```

### Getting Started

```
$ cd wednesday_worlds
$ bin/setup
```

### Deploy to Heroku

#### Staging

```
$ heroku container:push web --app wednesdayworlds-staging
$ heroku container:release web --app  wednesdayworlds-staging
```

#### Production

```
$ heroku container:push web --app wednesdayworlds
$ heroku container:release web --app wednesdayworlds
```

#### Generate events

```
$ heroku run "bin/rake events:generate[YYYY-MM-DD]" --app=wednesdayworlds
```

### Docker

#### Setup

```
$ cp .env-sample .env
$ docker compose build --pull web
```

#### Start the server

```
$ docker compose up web
```

#### Console

```
$ docker compose run --rm web bin/rails c
```

#### Install gems

```
$ docker compose run --rm web bundle install
```

#### Update gems

```
$ docker compose run --rm web bundle update rails
```

#### Run tests

```
$ docker compose run --rm test bin/rails spec
```

#### Volumes

Reset docker volumes (keep in mind this will remove all postgres data and bundled gems)

```
$ docker compose down --volumes
```

### Litestream config

```
STORAGE_MODE=replication
LITESTREAM_REPLICA_URL=s3://wednesdayworlds/data/development.sqlite3
LITESTREAM_ACCESS_KEY_ID=<access_key_id>
LITESTREAM_SECRET_ACCESS_KEY=<secret_access_key>
LITESTREAM_DATA_PATH=/data/db/development.sqlite3
```

#### `STORAGE_MODE` config

* `local` – DB only stored locally in `db` – useful for local development.
* `restore_only` – DB restored from S3 (without replication) – useful if you need to replicate data from another host.
* `replication` – DB restored from S3 (with replication)

**Notes:**
* Bundler needs to be configured with env vars (on Heroku)
* Make sure that assets are compiled for production
* Make sure to set `RAILS_SERVE_STATIC_FILES=true`

https://devcenter.heroku.com/articles/container-registry-and-runtime

### License

Code is licensed under the [MIT License](LICENSE); site content (copy, ride/route descriptions) is licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).

Copyright © 2010-2026 Wednesday Worlds.
