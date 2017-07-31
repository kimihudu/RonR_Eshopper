class Category
  include Mongoid::Document

  field :name, type: String
  field :lName, type: String
  field :sub_cat
  field :status

end
