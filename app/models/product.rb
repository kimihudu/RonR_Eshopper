

class Product
  include Mongoid::Document
  include Mongoid::Search



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

  mount_uploader :img, ImageUploader
  search_in :name, :model, :price, :cat_name => [:name, :sub]

  # def self.search(search, page = 1)
  #   # where('name LIKE ?', "%#{data}%")

  #   wildcard_search = "%#{search}%"
  #   if search
  #     where('name ILIKE ?', wildcard_search)
  #       .page(page)
  #       .per_page(9)
  #   else
  #     all
  #   end
  # end

  # def self.search(search)
  #   where('name LIKE ?', "%#{search}%")
  # end
end
