require 'spec_helper'

describe Contact do
  context '#results' do
    it 'shows info based on name choice' do 
      name = Name.new('mike piccolo')
      name.save
      contact_id = name.contact_id
      saved_email = Email.new({'email' => "555-555-5555", 'contact_id' => contact_id, 'type' => 'personal'})
      saved_email.save
      saved_address = Address.new({'mailing_address' => "555-555-5555", 'contact_id' => contact_id, 'type' => 'home'})
      saved_address.save
      saved_phone = Phone.new({'phone_number' => "555-555-5555", 'contact_id' => contact_id, 'type' => 'work'})
      saved_phone2 = Phone.new({'phone_number' => "555-355-5555", 'contact_id' => contact_id, 'type' => 'work'})
      saved_phone.save
      saved_phone2.save
      contact = Contact.new
      results = Contact.results('mike piccolo')
      p results.class
      results.should eq ('123132113')
    end
  end

  # context '#email' do
  #   it 'returns the email based on a name' do 
  #     name = Name.new('mike piccolo')
  #     name.save
  #     DB.exec("SELECT * FROM name;").map { |info| info }
  #     email1 = Email.new('mfpiccolo@gmail.com')
  #     email1.save
  #     contact = Contact.new
  #     contact.email('mike piccolo').should eq 'mfpiccolo@gmail.com'     
  #   end
  # end
end