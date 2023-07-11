class SessionsController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by(email: params[:email])
      if user.present? && user.valid_password?(params[:password])
        sign_in(user) # Use the Devise method to sign in the user
        redirect_to categories_path
      else
        flash.now[:error] = "Please enter valid information."
        render :new
      end
    end
  
    def destroy
      sign_out # Use the Devise method to sign out the user
      redirect_to splash_path
    end
  end
  