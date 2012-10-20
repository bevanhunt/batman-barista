class Order
  include Mongoid::Document
  include Mongoid::Timestamps
  attr_accessible :barista, :total_f, :hst_f, :sub_total_f
  attr_accessible :status, :sub_total, :items, :hst, :total, :compute
  auto_increment :number
  field :sub_total_f, type: Float
  field :total_f, type: Float
  field :hst_f, type: Float
  field :sub_total
  field :hst
  field :total
  field :barista
  field :status
  field :items, type: Integer
  field :compute, type: Boolean
  has_many :products, dependent: :delete
end