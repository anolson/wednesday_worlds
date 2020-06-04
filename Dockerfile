FROM ruby:2.6-alpine as build

RUN apk --no-cache add \
    build-base \
    libxml2-dev \
    libxslt-dev \
    nodejs \
    postgresql-client \
    postgresql-dev \
    tzdata
RUN gem install bundler:2.1.4

ENV APP_HOME /app
RUN mkdir -p $APP_HOME/vendor/bundle
WORKDIR $APP_HOME

COPY Gemfile Gemfile.lock $APP_HOME/
RUN bundle config set deployment true && \
    bundle config build.nokogiri --use-system-libraries && \
    bundle install

FROM ruby:2.6-alpine

RUN apk --no-cache add \
    libxml2-dev \
    libxslt-dev \
    nodejs \
    postgresql-client \
    tzdata
RUN gem install bundler:2.1.4

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN adduser -D appuser
USER appuser

COPY --chown=appuser:appuser . $APP_HOME
COPY --from=build --chown=appuser:appuser $APP_HOME/vendor/bundle $APP_HOME/vendor/bundle

RUN bundle config set deployment true && \
    bundle config set path /app/vendor/bundle

RUN bin/rake assets:precompile

CMD ["bin/server"]
