class Contact

  def results(name)
    result = DB.exec("SELECT name.name, phone_number.phone_number, email.email, mailing_address.mailing_address
                      FROM name, phone_number, email, mailing_address 
                      WHERE name.name = '#{name}' and name.id = phone_number.id and name.id = mailing_address.id and name.id = email.id ").map { |info| info }
  end

  def email(name)
    @email1= ""
    DB.exec("SELECT currval(pg_get_serial_sequence('name', 'id'))").map { |info| info }.each {|hash| hash.each_value {|value| @email1 = value }}
    result = DB.exec("SELECT email.email FROM email, name WHERE name.name = '#{name}' and name.id = email.id;").map { |info| info }
    result.each {|hash| hash.each_value {|value| @email1 = value }}
    @email1
  end






end
