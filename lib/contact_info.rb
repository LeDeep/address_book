class ContactInfo
  attr_reader :name
  def initialize(name, phone, email, address)
    @name = name
    @phone = phone
    @email = email
    @address = address
  end


  def save_name
    DB.exec("INSERT INTO name (name) VALUES ('#{@name}')")
  end

  def save_phone
    DB.exec("INSERT INTO phone_number (phone_number) VALUES ('#{@phone}')")
  end

  def save_email
    DB.exec("INSERT INTO email (email) VALUES ('#{@email}')")
  end

  def save_mailing_address
    DB.exec("INSERT INTO mailing_address (mailing_address) VALUES ('#{@address}')")
  end

  def self.all
    DB.exec("SELECT * FROM name").inject([]) { |name, name_hash| name << ContactInfo.new(name_hash['name'], '', '', '')}
  end


end
