require_relative 'spec_helper'

describe SchemaBuilder do
  context '#build' do
    let(:schema) {SchemaBuilder.build("spec/sample_schema.rb").first}
    it {expect(schema).is_a? Schema}
    it {expect(schema.on).to eq 'someRegExp'}
    it {expect(schema.fields.count).to eq 2}
    it {expect(schema.fields[0].name).to eq :title}
    it {expect(schema.fields[1].name).to eq :articles}
  end
end