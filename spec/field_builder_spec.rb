require_relative 'spec_helper'

describe FieldBuilder do
  context '#build' do
    context 'string with xpath' do
      let(:field) do
          FieldBuilder.build do
            string :title, xpath: "someXPath"
          end
      end

      it {expect(field.name).to eq :title}
      it {expect(field.type).to eq :string}
      it {expect(field.xpath).to eq "someXPath"}
    end

    context 'integer with xpath' do
      let(:field) do
        FieldBuilder.build do
          integer :count, xpath: "someXPath"
        end
      end

      it {expect(field.name).to eq :count}
      it {expect(field.type).to eq :integer}
      it {expect(field.xpath).to eq "someXPath"}
    end

    context 'set with xpath' do
      let(:field) do
        FieldBuilder.build do
          set :articles, xpath: "someXPath"
        end
      end

      it {expect(field.name).to eq :articles}
      it {expect(field.type).to eq :set}
      it {expect(field.xpath).to eq "someXPath"}
    end
  end
end