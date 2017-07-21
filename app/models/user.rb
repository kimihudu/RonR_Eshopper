class User
  include Mongoid::Document
  field :usrName, type: String
  field :psw, type: String
  field :name, type: String
  field :role, type: String
  field :email, type: String

  embeds_one :address, class_name: "Address"
  embeds_one :cart, class_name: "Cart"
  embeds_one :wishlist, class_name: "Wishlist"
end
