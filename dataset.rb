class Dataset
  attr_accessor :name
  attr_reader   :data
  attr_writer   :color

  def initialize options = {}
    self.data = options[:data] || options['data']
    options.each { |k,v| instance_variable_set "@#{k}", v }
  end

  def color
    @color.to_hex_color unless @color.blank?
  end

  def data= data
    raise "Data should not be empty" if data.blank?
    raise "Data should be an array"  unless data.is_a? Array
    @data = data
  end

  def encoded_data encoding = :text
    return @data.join(',') if encoding == :text
    @data.map { |n| n.blank? ? '_' : n.send(encoding) }.join('')
  end
end