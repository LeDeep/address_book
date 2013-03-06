class Phone
  attr_reader :phone, :contact_id

  def initialize(attributes)
    @contact_id = attributes['contact_id']
    @phone = attributes['phone_number']
    @phone_type = attributes['phone_type']
  end

  def save
    DB.exec("INSERT INTO phone_number (phone_number, contact_id, type) VALUES ('#{@phone}', '#{@contact_id}', '#{@phone_type}')")
  end

  def self.all
    Phone.from_pg_result(DB.exec("SELECT * FROM phone_number"))
  end

  def self.find(contact_id_match)
    Phone.from_pg_result(DB.exec("SELECT phone_number, contact_id, type FROM phone_number WHERE '#{contact_id_match}' = contact_id ")).first
  end

  def ==(other)
    self.phone == other.phone && self.contact_id == other.contact_id
  end


  private

  def self.from_pg_result(pg_result)
    pg_result.inject([]) { |number, number_hash| number << Phone.new(number_hash)}
  end


end