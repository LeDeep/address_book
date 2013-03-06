require 'spec_helper'

describe Name do 

   context '.all' do
    it 'lists all the names in address_book' do
      names = ['Mike Piccolo', 'Michael K-N', 'Peter Lowry']
      names.each {|name| Name.new(name).save}
      Name.all.map {|info| info.name}.should =~ names
    end
  end

  context '#save' do 
     it 'saves the task to the database' do
      name = Name.new('Test')
      expect {name.save}.to change {Name.all.length}.by 1
    end
  end
   

 context '#contact_id' do 
    it 'should be nil before saving' do 
      info = Name.new('Mike Piccolo')
      info.contact_id.should be_nil
    end
  
    it 'should have the database value after saving' do
      info = Name.new('Mike Piccolo') 
      info.save
      info.contact_id.should_not be_nil
      original_id = info.contact_id
      info.get_unique_id("Mike Piccolo").should eq original_id
    end
  end
end