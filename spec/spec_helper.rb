require 'rspec'
require 'pg'
require 'name'
require 'phone'
require 'email'
require 'address'
require 'contact'

DB = PG.connect(:dbname => 'address_book_test')

RSpec.configure do |config|
  config.after(:each) do 
    # DB.exec("DELETE FROM name *;")
    # DB.exec("DELETE FROM email *;")
    # DB.exec("DELETE FROM phone_number *;")
    # DB.exec("DELETE FROM mailing_address *;")
  end
end
