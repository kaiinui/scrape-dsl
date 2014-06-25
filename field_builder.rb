require_relative 'field'

class FieldBuilder
  attr_accessor :field

  class << self
    def build(&blk)
      instance = new
      instance.field = Field.new
      instance.instance_eval &blk
      instance.field
    end
  end

  def typed(type, name, options = {})
    field.type = type
    field.name = name
    field.xpath = options[:xpath]
  end

  def string(name, options = {})
    typed(:string, name, options)
  end

  def integer(name, options = {})
    typed(:integer, name, options)
  end

  def set(name, options = {})
    typed(:set, name, options)
  end
end