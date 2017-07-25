class ProductsController < ApplicationController
  def index
    @brands = Brand.all
    @categories = Category.all
    @products = Product.all
  end

  def show
    @brands = Brand.all
    @categories = Category.all
    @products = Product.all
  end
end
