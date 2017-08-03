class ProductDetailController < ApplicationController

  def index
  end

  def show
    @prod = Product.find(params[:id])
  end
end
