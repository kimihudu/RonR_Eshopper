class SearchController < ApplicationController
  def index
    @brands = Brand.all
    @categories = Category.all
    @products = Product.all
  end
  def show
    
  end
end
