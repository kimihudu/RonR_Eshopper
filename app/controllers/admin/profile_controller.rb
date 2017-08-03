class Admin::ProfileController < ApplicationController
  layout 'cust_admin'
  before_actions :ensure_admin!

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def ensure_admin!
    unless current_user != nil && current_user.admin?
      sign_out current_user

      redirect_to root_path

      false
    end
  end
end
