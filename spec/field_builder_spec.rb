require_relative 'spec_helper'

describe FieldBuilder do
  context 'build' do
    let (:field) {
        FieldBuilder.build do
          string :title, xpath: "someXPath"
        end
    }

    it {expect(field.name).to eq :title}
    it {expect(field.type).to eq :string}
    it {expect(field.xpath).to eq "someXPath"}
  end
end