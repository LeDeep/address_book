require 'spec_helper'

describe Address do 
  context '#save' do 
    it 'saves contact email to the database' do 
      name = Name.new("name")
      DB.exec("SELECT currval(pg_get_serial_sequence('name', 'id'))").map { |info| info }.each {|hash| hash.each_value {|value| @contact_id = value }}
      contact_id = name.get_unique_id("name")
      info = Address.new('1715 I Street Sacramento, CA 95819', 'contact_id')
      info.save
    end
  end
end