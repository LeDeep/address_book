require 'spec_helper'

describe Phone do 

  context '#initialize' do
    it 'accepts a hash of attributes as an argument' do
      attributes = {'phone_number' => '415.555.1212', 'contact_id' => '5', 'type' => 'cell'}
      phone = Phone.new(attributes)
      phone.should be_an_instance_of Phone
    end
  end

  context '#find' do
    it 'finds the phone number by its id number' do
      saved_phone = Phone.new({'phone_number' => "555-555-5555", 'contact_id' => '1', 'type' => 'work'})
      saved_phone.save
      contact_id = saved_phone.contact_id
      found_phone = Phone.find(contact_id)
      found_phone.should eq saved_phone
    end
  end

  context '.all' do
    it 'lists all the names in address_book' do
      numbers = [{'phone_number' => "555-555-5555", 'contact_id' => '1', 'type' => 'work' }, {'phone_number' => "555-555-5556", 'contact_id' => '2', 'type' => 'work'}, {'phone_number' => "555-555-5557", 'contact_id' => '3', 'type' => 'work'}]
      numbers.each {|number| Phone.new(number).save}
      Phone.all.map {|number| number.phone }.should =~ numbers.map {|number| number['phone_number'] }
    end
  end

  context '#save' do 
    it 'saves the task to the database' do
      name = Name.new('Test')
      name.save
      contact_id = name.contact_id
      phone = Phone.new({ 'phone_number' => '916-671-4289', 'contact_id' => contact_id, 'type' => 'work'})
      expect {phone.save}.to change {Phone.all.length}.by 1
    end
  end

  context '#contact_id' do
    it 'should have the database value after saving' do
      name = Name.new('Mike Piccolo') 
      name.save
      phone = Phone.new({ 'phone_number' => '916-966-0701', 'contact_id' => name.contact_id, 'type' => 'work'})
      phone.contact_id.should eq name.contact_id
    end
  end

  context '#==' do 
    it 'should say the two objects are equal if their contact_id and phone_number are equal' do 
      phone1 = Phone.new({ 'phone_number' => "555-555-555", 'contact_id' => '1', 'type' => 'work'})
      phone2 = Phone.new({ 'phone_number' => "555-555-555", 'contact_id' => '1', 'type' => 'work'})
      phone1.should eq phone2
    end
  end



end