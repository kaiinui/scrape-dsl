require_relative 'spec_helper'

describe SchemaBuilder do
  let(:schema) {SchemaBuilder.build("sample_schema.rb")}
  it {expect(schema).is_a? Schema}
end