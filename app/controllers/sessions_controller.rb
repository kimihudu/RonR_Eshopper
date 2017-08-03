class SessionsController < ApplicationController
  def login; end

  def login_attempt
    authorized_user = User.authenticate(params[:username_or_email], params[:login_password])
    if authorized_user
      flash[:success] = "Wow Welcome again, you logged in as #{authorized_user.username}"
      redirect_to(action: 'home')
    else
      flash[:danger] = 'Invalid Username or Password'
      render 'login'
    end
  end

  def home; end

  def profile; end

  def setting; end
end
