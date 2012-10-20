class ProductSerializer < ActiveModel::Serializer
  attributes :id, :type, :names, :sizes, :compute, :name, :size, :units
  attributes :grams, :price_per_gram, :price_rate, :total, :modifications
  attributes :food, :drink, :order_id
end