class Drink
  include Mongoid::Document
  include Mongoid::Timestamps
  attr_accessible :price, :name, :size
  field :price, type: Float
  field :name
  field :size
end