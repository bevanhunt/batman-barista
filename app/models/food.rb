class Food 
  include Mongoid::Document
  include Mongoid::Timestamps
  attr_accessible :price_per_gram, :base_price, :name
  field :price_per_gram, type: Float
  field :base_price, type: Float
  field :name
end