class Phone

  def initialize(phone, contact_id)
    @phone = phone
    @contact_id = contact_id
  end

  def save
    DB.exec("INSERT INTO phone_number (phone_number) VALUES ('#{@phone}')")
    DB.exec("INSERT INTO phone_number (contact_id) VALUES ('#{@contact_id.to_i}')")

  end


end