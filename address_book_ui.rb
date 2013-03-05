require 'pg'
require './lib/contact_info'
require './lib/name'
require './lib/phone'
require './lib/email'
require './lib/address'



DB = PG.connect(:dbname => 'address_book')



def welcome
  puts 'Welcome to the Address Book App.'
  menu
end

def menu
  choice = nil
  until choice == 'q'
    puts "Press 'a' to add a contact and their info, press 'l' to list all\
     of your stored contacts, press 'v' to view a contact and their info, press\
      'e' to edit contact information, press 'd' to delete a contact."
    puts "Press 'q' at any time to quit"
    choice = gets.chomp
    case choice
    when 'a'
      name = nil
      phone = nil
      email = nil
      address = nil
      next if name == 's' 
        puts "Enter a contact name, or press 's' to skip."
        name = Name.new(gets.chomp)
      next if phone == 's' 
        puts "Enter a phone number for #{name.name}, or press 's' to skip."
        phone = Phone.new(gets.chomp)
      next if email == 's' 
        puts "Enter a email address for #{name.name}, or press 's' to skip."
        email = Email.new(gets.chomp)
      next if address == 's'
        puts "Enter a mailing address for #{name.name}, or press 's' to skip."
        address = Address.new(gets.chomp)
        add(name, phone, email, address)
    when 'l'
      list
    when 'v'
      puts "Which contact would you like to view"
      choice = gets.chomp
      view(choice)
      #convert name to name.id
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
  name.save
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
  result = DB.exec("SELECT name.name, phone_number.phone_number, email.email, mailing_address.mailing_address
                    FROM name, phone_number, email, mailing_address 
                    WHERE name.name = '#{name}' and name.id = phone_number.id and name.id = mailing_address.id and name.id = email.id ").map { |info| info }
  puts "Here is the info for #{name}:"
  result.each {|hash| hash.each_value {|value| print value + " \n" }}  
  print "\n"
end

def edit

end

welcome


# && name.id = email.id && name.name = address.id && name.id = email.id && name.name = address.id






