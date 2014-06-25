require_relative 'schema'
require_relative 'field_builder'

class SchemaBuilder
  attr_accessor :schemas

  class << self
    def build(path)
      instance = new
      instance.schemas = []
      instance.instance_eval File.read(path)
      instance.schemas
    end
  end

  def on_pages_like(regexp, &blk)
    schema = Schema.new
    schema.on = regexp
    schema.fields = FieldBuilder.build(&blk)
    schemas.push schema
  end
end