require 'pg'
require './lib/contact'
require './lib/name'
require './lib/phone'
require './lib/email'
require './lib/address'



DB = PG.connect(:dbname => 'address_book')

def empty_db
   DB.exec("DELETE FROM name *;")
   DB.exec("DELETE FROM email *;")
   DB.exec("DELETE FROM phone_number *;")
   DB.exec("DELETE FROM mailing_address *;")
end

def welcome
  empty_db
  puts 'Welcome to the Address Book App.'
  menu
end

def menu
  choice = nil
  until choice == 'q'
    puts "Press 'a' to add a contact and their info, press 'l' to list all\
     of your stored contacts, press 'v' to view a contact and their info, press\
      'e' to edit contact information, press 'd' to delete a contact."
    puts "Press 'q' at any time to quit."
    choice = gets.chomp
    case choice
    when 'a'
      name = nil
      phone = nil
      email = nil
      address = nil
      contact_id = nil
      next if name == 's' 
        puts "Enter a contact name, or press 's' to skip."
        name = Name.new(gets.chomp)
        name.save
        contact_id = name.contact_id
      next if phone == 's'
        phone_type = nil
        entered_number = nil
        until phone_type == 'd' || entered_number == 'd'  
          puts "Enter a phone number for #{name.name}, or press 's' to skip.  When you are done entering numbers, press 'd'.\n"
          entered_number = gets.chomp
          break if phone_type == 'd' || entered_number == 'd'
          puts "What type of number is this? Press 'h' for home, 'w' for work and 'c' for cell.\n"
          phone_type = gets.chomp
          if phone_type == 'h' || phone_type == 'w' || phone_type == 'c'
            attributes = {'contact_id' => contact_id, 'phone_number' => entered_number, 'phone_type' => phone_type}
            Phone.new(attributes).save
          else
            phone_type = nil
          end
        end
      next if email == 's' 
        email_type = nil
        entered_address = nil
        until email_type == 'd' || entered_address == 'd' 
          puts "Enter an email address for #{name.name}, or press 's' to skip.  When you are done entering emails, press 'd'.\n"
          entered_address = gets.chomp
          break if email_type == 'd' || entered_address == 'd'
          puts "What type of email address is this? Press 'p' for personal, 'w' for work.\n"
          email_type = gets.chomp
          if email_type == 'p' || email_type == 'w'
            attributes = {'contact_id' => contact_id, 'email' => entered_address, 'email_type' => email_type}
            Email.new(attributes).save
          else
            email_type = nil
          end
        end
      next if address == 's'
        address_type = nil
        entered_mailing_address = nil
        until address_type == 'd' || entered_mailing_address == 'd' 
          puts "Enter an address for #{name.name}, or press 's' to skip.  When you are done entering addresses, press 'd'.\n"
          entered_mailing_address = gets.chomp
          break if address_type == 'd' || entered_mailing_address == 'd'
          puts "What type of address is this? Press 'h' for home, 'w' for work.\n"
          address_type = gets.chomp
          if address_type == 'h' || address_type == 'w'
            attributes = {'contact_id' => contact_id, 'mailing_address' => entered_mailing_address, 'address_type' => address_type}
            Address.new(attributes).save
          else
            address_type = nil
          end      
        end
    when 'l'
      list
    when 'v'
      puts "Please enter a name:"
      view(gets.chomp)
    when 'e'
      edit
    when 'd'
      delete
    else
      invalid
    end
  end
end




def add(name, phone, email, address)
  phone.save
  email.save
  address.save
  "#{name} and their info has been added to your Address Book."
end

def list
puts "Here are all your contacts."
names = Name.all
names.each { |name| puts name.name}
end

def view(name)
  result = Contact.results(name)
  puts "Here is the info for #{name}:"
  result.each {|hash| hash.each_value {|value| print value + " \n" }}  
  print "\n"
end

def edit

end

welcome


# && name.id = email.id && name.name = address.id && name.id = email.id && name.name = address.id






