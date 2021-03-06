class Admin::ProductsController < ApplicationController
  layout 'cust_admin'
  # before_action :authenticate_user!
  before_action :ensure_admin!

  def index
    # @categories = Category.all
    @products = Product.all
  end

  def show
    @prod = Product.find(params[:id])
  end

  def edit
    @prod = Product.find(params[:id])
    @categories = Category.all

  end


  def update  # save all changes from edit form
    @prod = Product.find(params[:id])
    params[:img] = 'im controller'

     if @prod.update(pro_params)
       flash[:success] = t 'product.update.success'
       redirect_to admin_products_path
     else
       flash[:danger] = t 'product.update.error'
      render action: 'edit'
       end
  end


  def destroy #delete selected item
    @prod = Product.find(params[:id])

    if @prod.destroy
      flash[:success] = t 'product.destroy.success'
    else
      flash[:danger] = t 'product.destroy.error'
  end
    redirect_to admin_products_path
    end



  def new
    @prod = Product.new
  end


  def create  # save created record

    @prod = Product.new pro_params

    # upload_img @prod

    if @prod.save
       flash[:success] = t "product.create.success"
       redirect_to admin_products_path
     else
       flash[:danger] = t "product.create.error"
       render :new
     end

  end

  def upload_img (prod)

    # name = params[:upload][:img].original_filename
    # directory = "public/images/home/upload"
    # path = File.join(directory, name)
    # File.open(path, "wb") { |f| f.write(params[:upload][:img].read) }
    # flash[:notice] = "File uploaded"

    # :img =  params[:file].original_filename

    img = prod.img
    IO.copy_stream(self.params[:img][0].tempfile, local_filepath)
    directory = "public/images/home/upload"
    destiny_file = File.join(directory, 'uploads', self.params[:img].original_filename)
    FileUtils.move img.path, destiny_file
    prod.img = destiny_file

  end

  def addAt
    @prod = Product.find(params[:id])
  end

  private
  def pro_params
    params.require(:product).permit( :name, :brand_name, :cat_name, :price, :unit_qTy, :size, :history, :img, :cat_name => [:name,:sub] )
    #, :history, :img  : [[:date,:price]])
  end

  def ensure_admin!
    unless current_user != nil && current_user.admin?

      sign_out current_user

      redirect_to root_path

      false
    end
  end
end
