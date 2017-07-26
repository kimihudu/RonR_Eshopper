class User
  include Mongoid::Document

  attr_accessor :psw
  attr_accessible :usrname, :email, :psw, :role
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  validates :usrname, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  # validates :psw, :confirmation => true #password_confirmation attr
  validates_length_of :psw, :in => 6..20, :on => :create

  field :usrname, type: String
  field :psw, type: String
  field :name, type: String
  field :role, type: String
  field :email, type: String
  field :address, type: Hash
  field :cart, type: Hash
  field :wishlist, type: Hash

before_save :encrypt_password
after_save :clear_password

def encrypt_password
  if psw.present?
    self.salt = BCrypt::Engine.generate_salt
    self.encrypted_password= BCrypt::Engine.hash_secret(psw, salt)
  end
end

def clear_password
  self.psw = nil
end

end
