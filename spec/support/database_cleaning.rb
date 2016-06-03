RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :trunctaion
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do

  end

end
