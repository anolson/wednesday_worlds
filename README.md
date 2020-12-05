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
$ git push staging master
```

From a feature branch:

```
$ git push staging feature:master
```


#### Production

```
$ git push production master
```

#### Generate events

```
$ rake events:generate[YYYY-MM-DD]
```

### Docker

#### Setup

```
$ cp .env-sample .env
$ docker-compose build web
```

#### Start the server

```
$ docker-compose up
```

#### Console

```
$ docker-compose run --rm web bin/rails c
```

#### Heroku

```
$ heroku container:login
$ heroku container:push web --arg RAILS_ENV=production --app <app>
$ heroku container:release web --app <app>
```

**Notes:**
* Bundler needs to be configured with env vars (on Heroku)
* Make sure that assets are compiled for production

https://devcenter.heroku.com/articles/container-registry-and-runtime

### License

(The MIT License)

Copyright © 2010-2020 Andrew Olson.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the ‘Software’), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED ‘AS IS’, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
