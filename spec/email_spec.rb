require 'spec_helper'

describe Email do 


  context '#save' do 
    it 'saves contact email to the database' do 
      name = Name.new("name")
      DB.exec("SELECT currval(pg_get_serial_sequence('name', 'id'))").map { |info| info }.each {|hash| hash.each_value {|value| @contact_id = value }}
      contact_id = name.get_unique_id("name")
      info = Email.new('smarreddy1@gmail.com', contact_id.to_i)
      info.save
    end
  end
end