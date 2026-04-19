# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This App Does

Wednesday Worlds is a Rails web application (https://wednesdayworlds.org) that manages weekly cycling events — scheduling rides, generating events on a repeating route cycle, and notifying subscribers via email.

## Commands

### Development

```bash
bin/setup                          # Initial setup
bin/server                         # Start dev server (local)
docker compose up web              # Start dev server (Docker)
docker compose run --rm web bin/rails c  # Rails console
```

### Tests

```bash
bin/rails spec                     # Run all tests
bundle exec rspec spec/path/to/file_spec.rb  # Run a single spec
docker compose run --rm test bin/rails spec  # Run tests in Docker
```

### Assets

```bash
npm run build:css                  # Compile SASS → app/assets/builds/
```

### Rake Tasks

```bash
bin/rake events:generate[YYYY-MM-DD]   # Generate 33 weeks of events from date
bin/rake send_notifications            # Send weekly email notifications (runs Wednesdays)
```

### Deploy (Heroku)

```bash
heroku container:push web --app wednesdayworlds-staging
heroku container:release web --app wednesdayworlds-staging
heroku run "bin/rake events:generate[YYYY-MM-DD]" --app=wednesdayworlds
```

## Architecture

### Core Models

- **Ride** — a named cycling event series (e.g. "Wednesday Worlds"), `has_many :notifiers, :events`
- **Route** — a named route with description, map_url, and slug, `has_many :events`
- **Event** — a scheduled occurrence linking a Ride + Route with a `begins_at` datetime; key scopes: `upcoming`, `this_week`, `next_week`
- **Notifier** (STI) — base class with `type` column; `EmailNotifier` subclass sends mail via `EventMailer`; designed to be extended for additional notification channels
- **User** / **UserSession** — custom session-based admin auth using `has_secure_password`

### Key App Logic

- `app/lib/weekly_event_notifier.rb` — called by the `send_notifications` rake task; iterates notifiers and fires them
- `lib/tasks/events.rake` — `events:generate` uses a hard-coded 33-week route rotation template to bulk-create events
- `app/mailers/event_mailer.rb` — sends event notification emails

### Request Flow

- **Public**: `PagesController#index` → shows this week's event + upcoming events
- **Admin**: namespaced under `/admin`, protected by `Admin::AdminController` auth filter; CRUD for Rides, Routes, Events, Notifiers

### Stack Notes

- Rails 7.1.6, Ruby 3.4.x, SQLite3
- No ActiveJob/background workers — notifications triggered manually via rake task
- SASS via cssbundling-rails (npm script), Sprockets for asset pipeline
- Docker + Heroku container registry for deployment; Litestream for SQLite S3 backup/replication
- Redcarpet for Markdown rendering in views
