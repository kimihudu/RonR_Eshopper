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


  def self.search(search, page = 1)
    # where('name LIKE ?', "%#{data}%")

    wildcard_search = "%#{search}%"
    if search
      where('name ILIKE ?', wildcard_search)
        .page(page)
        .per_page(9)
    else
      all
    end
end
end
