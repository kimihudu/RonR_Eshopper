<<<<<<< HEAD
class HomeController < ApplicationController
  def index
    @brands = Brand.all
    @categories = Category.all
    @products = Product.all
  end

  def new
   
  end

  private
  def brand_params
    params.require(:brand).permit(:name,:lName,:qTy)
  end
end
=======
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
>>>>>>> 848441ec1ddcee751fb194112b30a5dde167411e
