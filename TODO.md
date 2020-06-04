### Framework

* Update to Rails 5.
* Try http://tachyons.io

### Refactor

* Add presenters
* Pull admin/notifier into different engines.

### Misc

* Add a timeline/graph  of all routes/occurences

### Docker
* Use docker-compose ✅
* Drop sqlite3 ✅
* Drop FactoryGirl ✅
* Split Dockerfile into build stages
* Review Dockerfile
* Clean-up config/puma.rb
* Update README.md with docker usage
* .dockerignore

## Notes

### Building an image

```
docker build -t anolson/wednesday_worlds .
```

### Setup DB

```
docker-compose run --rm bin/rails db:setup
```

### Install gems

```
docker-compose run --rm bundle install
```
