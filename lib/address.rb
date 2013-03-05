class Address

  def initialize(address, contact_id)
    @address = address
    @contact_id = contact_id
  end

  def save
    DB.exec("INSERT INTO mailing_address (mailing_address, contact_id) VALUES ('#{@address}', '#{contact_id}')")
    # DB.exec("INSERT INTO mailing_address (contact_id) VALUES ('#{@contact_id.to_i}')")

  end

end
