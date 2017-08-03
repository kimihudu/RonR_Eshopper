class Admin::ProductsController < ApplicationController
  layout 'cust_admin'

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

     if @prod.update(pro_params)
       flash[:success] = t 'product.update.success'
       redirect_to admin_products_path
     else
       flash[:danger] = t 'product.update.error'
      render action: 'edit'
       end
  end


  def delete #delete selected item
    @prod = Product.find(params[:id])

    if @prod.delete
      flash[:success] = t 'product.delete.success'
    else
      flash[:danger] = t 'product.update.error'     
  end
    redirect_to admin_products_path
    end
    
  

  def new
    @prod = Product.new
  end

  
  def create  # save created record

    @prod = Product.new pro_params
    upload_img @prod

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

    tmp = params[:tmp_upload].tempfile
    IO.copy_stream(params[:tmp_upload][0].tempfile, local_filepath)
    directory = "public/images/home/upload"
    destiny_file = File.join(directory, 'uploads', params[:tmp_upload].original_filename)
    FileUtils.move tmp.path, destiny_file  
    prod.img = destiny_file

  end

  private
  def pro_params
    params.require(:prod).permit( :name, :brand_name, :cat_name,:model, :price, :unit_qTy, :img , :size, :history) #: [[:date,:price]])
  end
end
