class FoodSerializer < ActiveModel::Serializer
  attributes :id, :price_per_gram, :base_price, :name
end
