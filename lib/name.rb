class Name
attr_reader :name, :contact_id


  def initialize(name)
    @name = name
    @contact_id = nil
  end

  def get_unique_id(name)
    DB.exec("SELECT currval(pg_get_serial_sequence('name', 'id'))").map { |info| info }.each {|hash| hash.each_value {|value| @contact_id = value }}
    @contact_id
  end

  def save
    DB.exec("INSERT INTO name (name) VALUES ('#{@name}')")
  end

  def self.all
    DB.exec("SELECT * FROM name").inject([]) { |name, name_hash| name << Name.new(name_hash['name'])}
  end

end