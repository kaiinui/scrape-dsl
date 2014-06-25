require_relative 'schema'
require_relative 'field_builder'

class SchemaBuilder
  attr_accessor :schema

  class << self
    def build(path)
      instance = new
      instance.schema = Schema.new
      instance.instance_eval File.read(path)
      instance.schema
    end
  end

  def on_pages_like(regexp, &blk)
    schema.on = regexp
    schema.fields.push FieldBuilder.build(&blk)
  end
end