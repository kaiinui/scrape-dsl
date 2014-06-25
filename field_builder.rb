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

  def string(name, options = {})
    field.type = :string
    field.name = name
    field.xpath = options[:xpath]
  end
end