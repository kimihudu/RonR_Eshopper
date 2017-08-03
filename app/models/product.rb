class Product
  include Mongoid::Document

  field :name, type: String
  field :model, type: String
  field :brand_name, type: String
  field :price, type: Float
  field :img, type: String
  # field :available_date, type: Time
  # field :last_update, type: Time
  field :cat_name, type: Hash
  field :history, type: Array
  field :unit_qTy, type: Integer
  field :size, type: Hash



end
