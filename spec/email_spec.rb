require 'spec_helper'

describe Email do 

  context '#initialize' do
    it 'accepts a hash of attributes as an argument' do
      attributes = {'email' => '415.555.1212', 'contact_id' => '5', 'type' => 'personal'}
      email = Email.new(attributes)
      email.should be_an_instance_of Email
    end
  end

  context '#find' do
    it 'finds the email address by its id number' do
      saved_email = Email.new({'email' => "555-555-5555", 'contact_id' => '1', 'type' => 'personal'})
      saved_email.save
      contact_id = saved_email.contact_id
      found_email = Email.find(contact_id) 
      found_email.should eq saved_email
    end
  end

  context '.all' do
    it 'lists all the names in address_book' do
      addreses = [{'email' => "555-555-5555", 'contact_id' => '1', 'type' => 'personal'}, {'email' => "555-555-5556", 'contact_id' => '2', 'type' => 'personal'}, {'email' => "555-555-5557", 'contact_id' => '3', 'type' => 'personal'}]
      addreses.each {|address| Email.new(address).save}
      Email.all.map {|address| address.email }.should =~ addreses.map {|address| address['email'] }
    end
  end

  context '#save' do 
    it 'saves the task to the database' do
      name = Name.new('Test')
      name.save
      contact_id = name.contact_id
      email = Email.new({ 'email' => '916-671-4289', 'contact_id' => contact_id, 'type' => 'personal'})
      expect {email.save}.to change {Email.all.length}.by 1
    end
  end

  context '#contact_id' do
    it 'should have the database value after saving' do
      name = Name.new('Mike Piccolo') 
      name.save
      email = Email.new({ 'email' => '916-966-0701', 'contact_id' => name.contact_id, 'type' => 'personal'})
      email.contact_id.should eq name.contact_id
    end
  end

  context '#==' do 
    it 'should say the two objects are equal if their contact_id and email are equal' do 
      email1 = Email.new({ 'email' => "555-555-555", 'contact_id' => '1', 'type' => 'personal'})
      email2 = Email.new({ 'email' => "555-555-555", 'contact_id' => '1', 'type' => 'personal'})
      email1.should eq email2
    end
  end



end