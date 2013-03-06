class Email
  attr_reader :email, :contact_id

  def initialize(attributes)
    @contact_id = attributes['contact_id']
    @email = attributes['email']
    @email_type = attributes['email_type']
  end

  def save
    DB.exec("INSERT INTO email (email, contact_id, type) VALUES ('#{@email}', '#{@contact_id}', '#{@email_type}')")
  end

  def self.all
    Email.from_pg_result(DB.exec("SELECT * FROM email"))
  end

  def self.find(contact_id_match)
    Email.from_pg_result(DB.exec("SELECT email, contact_id, type FROM email WHERE '#{contact_id_match}' = contact_id ")).first
  end

  def ==(other)
    self.email == other.email && self.contact_id == other.contact_id
  end


  private

  def self.from_pg_result(pg_result)
    pg_result.inject([]) { |address, address_hash| address << Email.new(address_hash)}
  end


end