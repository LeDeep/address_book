class Address
  attr_reader :address, :contact_id

  def initialize(attributes)
    @contact_id = attributes['contact_id']
    @address = attributes['mailing_address']
    @address_type = attributes['address_type']
  end

  def save
    DB.exec("INSERT INTO mailing_address (mailing_address, contact_id, type) VALUES ('#{@address}', '#{@contact_id}', '#{@address_type}')")
  end

  def self.all
    Address.from_pg_result(DB.exec("SELECT * FROM mailing_address"))
  end

  def self.find(contact_id_match)
    Address.from_pg_result(DB.exec("SELECT mailing_address, contact_id, type FROM mailing_address WHERE '#{contact_id_match}' = contact_id ")).first
  end

  def ==(other)
    self.address == other.address && self.contact_id == other.contact_id
  end


  private

  def self.from_pg_result(pg_result)
    pg_result.inject([]) { |address, address_hash| address << Address.new(address_hash)}
  end


end