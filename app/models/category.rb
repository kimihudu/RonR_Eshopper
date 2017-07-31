class Category
  include Mongoid::Document

  field :name, type: String
  field :lName, type: String
  field :sub_cat, type: String
  field :status, type: String

end
