class Email

  def initialize(email, contact_id)
    @email = email
    @contact_id = contact_id
  end

  def save
    DB.exec("INSERT INTO email (email, contact_id) VALUES ('#{@email}', '#{@contact_id}')")
    # DB.exec("INSERT INTO email (contact_id) VALUES ('#{@contact_id.to_i}')")

  end

end