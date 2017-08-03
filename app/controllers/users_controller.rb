class UsersController < ApplicationController
  #   load_and_authorize_resource
  before_action :authenticate_user!

  def index
    @users = User.paginate page: params[:page], per_page: Settings.length.page
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if user.save?
      redirect_to root_path
    else
      redirect_to new_user_session_path
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    user = User.find params[:id]
    if user.update_attributes user_params
      flash[:success] = t 'users.update.success'
    else
      flash[:danger] = t 'users.update.error'
    end
    redirect_to users_path
  end

  def destroy
    user = User.find params[:id]
    if @user.destroy
      flash[:success] = t 'users.destroy.success'
    else
      flash[:danger] = t 'users.destroy.error'
    end
    redirect_to users_path
  end

  before_actions :ensure_admin!

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :admin, :authentication_token, :password_salt)
  end
end
