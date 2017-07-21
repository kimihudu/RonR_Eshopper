class Brand
  include Mongoid::Document
  field :name, type: String
  field :lName, type: String
  field :qTy, type: String
end
