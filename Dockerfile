FROM ruby:2.6-alpine

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
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ENV BUNDLE_PATH=/usr/local/bundle
COPY Gemfile Gemfile.lock $APP_HOME/
RUN bundle config set deployment true && \
    bundle config build.nokogiri --use-system-libraries && \
    bundle install

RUN adduser -D appuser
USER appuser

COPY --chown=appuser:appuser . $APP_HOME

RUN bin/rake assets:precompile

CMD bin/server
