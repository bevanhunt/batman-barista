class OrderSerializer < ActiveModel::Serializer
  attributes :id, :number, :hst, :sub_total, :total, :compute
  attributes :barista, :status, :items, :total_f, :sub_total_f, :hst_f
  has_many :products
end