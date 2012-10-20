class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  attr_accessible :type, :names, :sizes, :compute, :name, :size, :food, :drink
  attr_accessible :units, :grams, :price_per_gram, :price_rate, :total, :modifications 
  field :type
  field :name
  field :size
  field :units, type: Integer
  field :grams, type: Integer
  field :price_per_gram, type: Float
  field :price_rate, type: Float
  field :modifications, type: Array
  field :total, type: Float
  # boolean fields for form generator
  field :drink, type: Boolean
  field :food, type: Boolean
  field :compute, type: Boolean
  field :sizes, type: Array
  field :names, type: Array
  belongs_to :order
end