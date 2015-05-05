require "rspec"
require "pry"
require "doctor"
require "patient"
require "pg"

DB = PG.connect({:dbname => "docoffice_test"})


RSpec.configure do |config|
  config.after(:each) do
    DB.exec('DELETE from doctors *;')
    DB.exec('DELETE from patients *;')
  end
end
