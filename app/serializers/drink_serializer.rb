class DrinkSerializer < ActiveModel::Serializer
  attributes :id, :price, :name, :size
end
