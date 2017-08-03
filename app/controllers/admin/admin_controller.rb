class Admin::AdminController < ApplicationController


    def show

    end

    def destroy
        session.delete(:user_id)
        session.
        flash[:warning] = t 'admin logout'
        redirect_to 'home#index'
    end
end
