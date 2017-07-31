class Admin::ProductsController < ApplicationController
  layout 'cust_admin'

  def index
    @categories = Category.all
    @products = Product.all
  end

  def show
  end

  def edit
    @prod = Product.fin(params[:id])
  end

  def update
    @prod = Product.fin(params[:id])
  end

  def delete
    @prod = Product.fin(params[:id])
  end

  def new
    @prod = Product.new
  end

  def create
  end

  private
  def pro_params
    params.require(:prod).permit(:name, :cat_name, :price,:img,history: [[:date,:price]])
  end
end
