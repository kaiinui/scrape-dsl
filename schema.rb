require_relative 'field'

class Schema
  attr_accessor :fields, :on

  def initialize
    self.fields = []
  end
end