require_relative 'field'

class FieldBuilder
  attr_accessor :fields

  class << self
    def build(&blk)
      instance = new
      instance.instance_eval &blk
      instance.fields
    end
  end

  def initialize
    self.fields = []
  end

  def field(type, name, options = {})
    field = Field.new
    field.type = type
    field.name = name
    field.xpath = options[:xpath]
    fields.push field
  end

  def string(name, options = {})
    field(:string, name, options)
  end

  def integer(name, options = {})
    field(:integer, name, options)
  end

  def set(name, options = {})
    field(:set, name, options)
  end
end