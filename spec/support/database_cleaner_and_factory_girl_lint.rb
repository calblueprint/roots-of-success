RSpec.configure do |config|
  config.before(:suite) do
    begin
      DatabaseCleaner.clean_with(:truncation)
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  # This was causing issues with not having persisted models while emailing :(
  config.before(:each) do
    # DatabaseCleaner.start
  end

  config.after(:each) do
    # DatabaseCleaner.clean
  end
end
