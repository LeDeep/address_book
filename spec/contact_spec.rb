require 'spec_helper'

describe Contact do
  context '#email' do
    it 'returns the email based on a name' do
      name = Name.new('mike piccolo')
      name.save
      DB.exec("SELECT * FROM name;").map { |info| info }
      email1 = Email.new('mfpiccolo@gmail.com')
      email1.save
      contact = Contact.new
      contact.email('mike piccolo').should eq 'mfpiccolo@gmail.com'     
    end
  end
end