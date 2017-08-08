class SearchController < ApplicationController
  def index
    @brands = Brand.all
    @categories = Category.all
    if params[:search][:query]
      @products = Product.full_text_search(params[:search][:query])
      # @products = Product.search(params[:search][:query]).order('created_at DESC')
    else
      @products = Product.all.order('created_at DESC')
    end
  end

  def show; end

  # def search
  #   @search = params[:search][:query]
  # end
  # private
  # def data_params
  #   params.require(:pro).permit(:data)
  # end
end
