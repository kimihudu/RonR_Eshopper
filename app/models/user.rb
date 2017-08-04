class User
  include Mongoid::Document


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # :confirmable, :lockable, :timeoutable

  # attr_accessible :username,:email, :password, :password_confirmation, :remember_me
  # attr_accessible :usrname, :email, :psw, :role
  # EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  # validates :usrname, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  # validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  # # validates :psw, :confirmation => true #password_confirmation attr
  # validates_length_of :psw, :in => 6..20, :on => :create

  validates_presence_of :username
  validates_uniqueness_of :username, :email, case_sensitive: false

  field :username, type: String
  field :password, type: String
  field :admin, type: Boolean
  field :cart, type: Hash
  field :wishlist, type: Hash

  ## personal info
  field :first_name, type: String
  field :last_name, type: String
  field :address, type: Hash
  field :gender, type: String
  field :city, type: String
  field :country, type: String
  field :D_o_B, type: Time
  field :phone, type: Integer

  ## Database authenticatable
  field :email,              type: String, default: ''
  field :encrypted_password, type: String, default: ''

  ## Password Expirable
  field :password_changed_at, type: Time

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Encryptable
  field :password_salt, type: String

  # ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable
  # field :deactivated,          :type => Boolean, :default => false
  # field :status,               :type => String, :default =>  "pending" #Status::PENDING

  # ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  field :authentication_token, type: String

  # ## Invitable
  # field :invitation_token, :type => String
  # field :invitation_sent_at, :type => Time
  # field :invitation_accepted_at, :type => Time
  # field :invitation_limit, :type => Integer, :default => 0
  # field :invited_by_id, :type => String
  # field :invited_by_type, :type => String

  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.admin ||= false
  end

  # before_save :encrypt_password
  # after_save :clear_password

  # def encrypt_password
  #   if psw.present?
  #     self.salt = BCrypt::Engine.generate_salt
  #     self.encrypted_password= BCrypt::Engine.hash_secret(psw, salt)
  #   end
  # end

  # def clear_password
  #   self.psw = nil
  # end
end
