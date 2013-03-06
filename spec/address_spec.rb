require 'spec_helper'

describe Address do 

  context '#initialize' do
    it 'accepts a hash of attributes as an argument' do
      attributes = {'mailing_address' => '415.555.1212', 'contact_id' => '5', 'type' => 'home'}
      address = Address.new(attributes)
      address.should be_an_instance_of Address
    end
  end

  context '#find' do
    it 'finds the address number by its id number' do
      saved_address = Address.new({'mailing_address' => "555-555-5555", 'contact_id' => '1', 'type' => 'home'})
      saved_address.save
      contact_id = saved_address.contact_id
      found_address = Address.find(contact_id) 
      found_address.should eq saved_address
    end
  end

  context '.all' do
    it 'lists all the names in address_book' do
      addresses = [{'mailing_address' => "555-555-5555", 'contact_id' => '1', 'type' => 'home'}, {'mailing_address' => "555-555-5556", 'contact_id' => '2', 'type' => 'home'}, {'mailing_address' => "555-555-5557", 'contact_id' => '3', 'type' => 'home'}]
      addresses.each {|number| Address.new(number).save}
      Address.all.map {|number| number.address }.should =~ addresses.map {|number| number['mailing_address'] }
    end
  end

  context '#save' do 
    it 'saves the task to the database' do
      name = Name.new('Test')
      name.save
      contact_id = name.contact_id
      address = Address.new({ 'mailing_address' => '916-671-4289', 'contact_id' => contact_id, 'type' => 'home'})
      expect {address.save}.to change {Address.all.length}.by 1
    end
  end

  context '#contact_id' do
    it 'should have the database value after saving' do
      name = Name.new('Mike Piccolo') 
      name.save
      address = Address.new({ 'mailing_address' => '916-966-0701', 'contact_id' => name.contact_id, 'type' => 'home'})
      address.contact_id.should eq name.contact_id
    end
  end

  context '#==' do 
    it 'should say the two objects are equal if their contact_id and mailing_address are equal' do 
      address1 = Address.new({ 'mailing_address' => "555-555-555", 'contact_id' => '1', 'type' => 'home'})
      address2 = Address.new({ 'mailing_address' => "555-555-555", 'contact_id' => '1', 'type' => 'home'})
      address1.should eq address2
    end
  end



end