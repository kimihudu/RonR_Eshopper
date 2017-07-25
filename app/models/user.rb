class User
  include Mongoid::Document
  field :usrName, type: String
  field :psw, type: String
  field :name, type: String
  field :role, type: String
  field :email, type: String

end
