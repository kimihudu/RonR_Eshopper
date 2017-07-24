class HomeController < ApplicationController
  def index
    @brands = Brand.new;
  end
end
