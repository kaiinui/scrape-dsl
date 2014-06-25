require_relative 'spec_helper'

describe FieldBuilder do
  context '#build' do
    context 'build a field' do
      context 'string with xpath' do
        let(:field) do
          FieldBuilder.build {
            string :title, xpath: "someXPath"
          }.first
        end

        it {expect(field.name).to eq :title}
        it {expect(field.type).to eq :string}
        it {expect(field.xpath).to eq "someXPath"}
      end

      context 'integer with xpath' do
        let(:field) do
          FieldBuilder.build {
            integer :count, xpath: "someXPath"
          }.first
        end

        it {expect(field.name).to eq :count}
        it {expect(field.type).to eq :integer}
        it {expect(field.xpath).to eq "someXPath"}
      end

      context 'set with xpath' do
        let(:field) do
          FieldBuilder.build {
            set :articles, xpath: "someXPath"
          }.first
        end

        it {expect(field.name).to eq :articles}
        it {expect(field.type).to eq :set}
        it {expect(field.xpath).to eq "someXPath"}
      end
    end

    context 'build many fields' do
      let(:fields) do
        FieldBuilder.build {
          string :title, xpath: "some"
          integer :count, xpath: "some"
          set :articles, xpath: "some"
        }
      end

      it {expect(fields.count).to eq 3}
      it {expect(fields.select {|f|f.is_a? Field}.count).to eq 3}
    end
  end
end