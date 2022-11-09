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
$ docker compose up
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
LITESTREAM_REPLICA_URL=s3://wednesdayworlds/data/development.sqlite
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

(The MIT License)

Copyright © 2010-2022 Andrew Olson.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the ‘Software’), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED ‘AS IS’, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
