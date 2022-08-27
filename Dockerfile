FROM ruby:2.6-alpine as build

RUN apk --no-cache add \
    build-base \
    libxml2-dev \
    libxslt-dev \
    nodejs \
    postgresql-client \
    postgresql-dev \
    tzdata
RUN gem install bundler:2.3.21

ENV APP_HOME /app
RUN mkdir -p $APP_HOME/vendor/bundle
WORKDIR $APP_HOME

COPY Gemfile Gemfile.lock $APP_HOME/
RUN bundle config set deployment true && \
    bundle config build.nokogiri --use-system-libraries && \
    bundle install

#####################
# Development image #
#####################
FROM ruby:2.6-alpine as development

RUN apk --no-cache add \
    build-base \
    libxml2-dev \
    libxslt-dev \
    nodejs \
    postgresql-client \
    postgresql-dev \
    tzdata
RUN gem install bundler:2.3.21

ENV APP_HOME /app
ENV BUNDLE_PATH /app/vendor/bundle
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN adduser -D appuser
USER appuser

COPY --chown=appuser:appuser . $APP_HOME
COPY --from=build --chown=appuser:appuser $APP_HOME/vendor/bundle $APP_HOME/vendor/bundle

CMD ["bin/server"]

####################
# Production image #
####################
FROM ruby:2.6-alpine

RUN apk --no-cache add \
    libxml2-dev \
    libxslt-dev \
    nodejs \
    postgresql-client \
    tzdata
RUN gem install bundler:2.3.21

ENV APP_HOME /app
ENV BUNDLE_PATH /app/vendor/bundle
ENV BUNDLE_DEPLOYMENT true
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN adduser -D appuser
USER appuser

COPY --chown=appuser:appuser . $APP_HOME
COPY --from=build --chown=appuser:appuser $APP_HOME/vendor/bundle $APP_HOME/vendor/bundle

RUN RAILS_ENV=production SECRET_KEY_BASE=$(bin/rake secret) bin/rake assets:clean assets:precompile

CMD ["bin/server"]
