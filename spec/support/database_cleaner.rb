RSpec.configure do |config|
  DatabaseCleaner.url_allowlist = [
    proc { |uri| URI.parse(uri).path == "/wednesdayworlds_test" }
  ]

  config.before(:suite) do
    DatabaseCleaner.clean_with(:deletion)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :deletion
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
