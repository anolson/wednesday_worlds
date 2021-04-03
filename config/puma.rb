# frozen_string_literal: true

workers Integer(ENV.fetch("WEB_CONCURRENCY") { 5 })
threads_count = Integer(ENV.fetch("RAILS_MAX_THREADS") { 5 })
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV.fetch("PORT") { 3000 }
environment ENV.fetch("RAILS_ENV") { "development" }

# on_worker_boot do
#   ActiveRecord::Base.establish_connection
# end

plugin :tmp_restart
