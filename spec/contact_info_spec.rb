require 'spec_helper'

# describe ContactInfo do 
#   context '#save' do 
#     it 'saves contact name to the database' do 
#       DB.should_receive(:exec).with ("INSERT INTO name (name) VALUES ('John Miller')")
#       info = ContactInfo.new('John Miller', '916-966-0701', 'mfpiccolo@gmail.com', '')
#       info.save
#     end
#   end

#   context '#save' do 
#     it 'saves contact phone to the database' do 
#       DB.should_receive(:exec).with ("INSERT INTO phone_number (phone_number) VALUES ('916-966-0701')")
#       info = ContactInfo.new('Mike Piccolo', '916-966-0701', 'mfpiccolo@gmail.com', '')
#       info.save
#     end
#   end

  # context '#save' do 
  #   it 'saves contact email to the database' do 
  #     DB.should_receive(:exec).with ("INSERT INTO email (email) VALUES ('mfpiccolo@gmail.com')")
  #     info = ContactInfo.new('Mike Piccolo', '916-966-0701', 'mfpiccolo@gmail.com', '')
  #     info.save
  #   end
  # end

  # context '#save' do 
  #   it 'saves contact mailing address to the database' do 
  #     DB.should_receive(:exec).with ("INSERT INTO mailing_address (mailing_address) VALUES ('1715 I Street Sacramento, CA 95814')")
  #     info = ContactInfo.new('Mike Piccolo', '916-966-0701', 'mfpiccolo@gmail.com', '1715 I Street Sacramento, CA 95814')
  #     info.save
  #   end
  # end

  # context '.all' do
  #   it 'lists all the names in address_book' do
  #     names = ['Mike Piccolo', 'Michael K-N', 'Peter Lowry']
  #     names.each {|name| ContactInfo.new(name, '', '', '').save_name}
  #     ContactInfo.all.map {|info| info.name}.should =~ names
  #   end
  # end

  # context '#view' do 
  #   it 'shows contact information for a specifc contact' do 


    # end


  # end

# end
