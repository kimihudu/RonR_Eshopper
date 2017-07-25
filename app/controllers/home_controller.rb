class HomeController < ApplicationController
  def index
    @brands = Brand.all
    @categories = Category.all
    @products = Product.all
  end

  def new
    @brand = Brand.new
  end

  private
  def brand_params
    params.require(:brand).permit(:name,:lName,:qTy)
  end
end
