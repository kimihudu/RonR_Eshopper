class BrandController < ApplicationController
  def index
    @brand = Brand.all
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)

    if @person.save
      redirect_to brand_path, notice: "The brand has been created!" and return
    end
    render 'new'
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  def update
    @brand = Brand.find(params[:id])

    if @brand.update_attributes(brand_params)
      redirect_to brand_path, notice: "#{name} #{lName} #{qTy} has been updated!" and return
    end

    render 'edit'
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy

    redirect_to brand_path, notice:"#{name} #{lName} has been deleted" and return
  end

  private 
  def brand_params
    params.require(:brand).permit(:name,:lName,:qTy)
  end
end
