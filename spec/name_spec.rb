require 'spec_helper'

describe Name do 


  context '#save' do 
    it 'saves contact name to the database' do 
      DB.should_receive(:exec).with ("INSERT INTO name (name) VALUES ('Mike Piccolo')")
      info = Name.new('Mike Piccolo')
      info.save
    end
  end

   context '.all' do
    it 'lists all the names in address_book' do
      names = ['Mike Piccolo', 'Michael K-N', 'Peter Lowry']
      names.each {|name| Name.new(name).save}
      Name.all.map {|info| info.name}.should =~ names
    end
  end

  context '#get_unique_id' do 
    it 'gets the unique id from name' do
      info = Name.new('Mike Piccolo')
      info.save
      uniq = 332
      uniq += 5
      info.get_unique_id("Mike Piccolo").should eq uniq.to_s
    end
  end
end