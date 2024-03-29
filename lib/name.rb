class Name
attr_reader :name, :contact_id


  def initialize(name)
    @name = name
    @contact_id = nil
  end

  def get_unique_id(name)
    DB.exec("SELECT currval(pg_get_serial_sequence('name', 'contact_id'))").map { |info| info }.each {|hash| hash.each_value {|value| @contact_id = value }}
    @contact_id
  end

  def save
    @contact_id = DB.exec("INSERT INTO name (name) VALUES ('#{@name}') RETURNING contact_id;").map {|result| result['contact_id']}.first
  end

  def self.all
    DB.exec("SELECT * FROM name").inject([]) { |name, name_hash| name << Name.new(name_hash['name'])}
  end

end