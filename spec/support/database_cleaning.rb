RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :trunctaion
    DatabaseCleaner.clean_with(:truncation)
  end

end
