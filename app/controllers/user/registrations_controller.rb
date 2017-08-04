class User::RegistrationsController < Devise::RegistrationsController

    # def build_resource(*args)
    #     if params[:user]
    #     # So that the password isn't blanked out when the other validations fail. User shouldn't have to retype the password.
    #     @user_password = params[:user][:password]
    #     end
    #     super
    # end

    private
    def sign_up_params
        params.require(:user).permit(:username,:email, :password, :password_confirmation)
    end

    def account_update_params
          params.require(:user) .permit(:username,:email, :password, :password_confirmation,:current_password)
    end
end