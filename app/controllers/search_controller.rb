class SearchController < ApplicationController
  def index
    @brands = Brand.all
    @categories = Category.all
    if params[:search]
      @products = Product.search(params[:search]).order("created_at DESC")
    else
      @products = Product.all.order('created_at DESC')
    end
  end

  def show

  end

  # private
  # def data_params
  #   params.require(:pro).permit(:data)
  # end
end
