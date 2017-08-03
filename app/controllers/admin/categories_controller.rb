class Admin::CategoriesController < ApplicationController
  before_action :ensure_admin!


  layout 'cust_admin'

  def index # show list record
    @categories = Category.all
    @products = Product.all
 end

  def show # show detail record
    # @categories = Category.all
    # @products = Product.all
    @category = Category.find(params[:id])
  end

  def new # create new one record
    @category = Category.new
  end

  def create # save created record

    @category = Category.new category_params
    if @category.save
      flash[:success] = t "category.create.success"
      redirect_to admin_categories_path
    else
      flash[:danger] = t "category.create.error"
      render :new
    end
  end

  def edit # show selected record in form edit
    @category = Category.find(params[:id])
  end

  def update # save all changes from edit form
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = t 'category.update.success'
      redirect_to admin_categories_path
    else
      flash[:danger] = t 'category.update.error'
      render action: 'edit'
    end

  end

  def destroy # delete selected record
    @category = Category.find(params[:id])

    if @category.destroy
      flash[:success] = t 'category.destroy.success'
    else
      flash[:danger] = t 'category.destroy.error'
    end

  redirect_to admin_categories_path
  end

  private

  def category_params # if want to use params for nested attribute --> sub_cat: [:name]
    params.require(:category).permit(:name, :status, :sub_cat)
  end

  def ensure_admin!
    unless current_user != nil && current_user.admin?
      sign_out current_user

      redirect_to root_path

      false
    end
  end
end
