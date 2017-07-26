class Product
  include Mongoid::Document

  field :name, type: String
  field :lName, type: String
  field :model, type: String
  field :brand_name, type: String
  field :price, type: Float
  field :img, type: String
  field :available_date, type: Time
  field :last_update, type: Time
  field :cat_name, type: Hash
  field :assets, type: Array
  field :history, type: Array

end
