class SessionsController < ApplicationController
  before_action :block_access, except: [:destroy]
  def new
  end
  def create
        @user = User.find_by(email: params[:session][:email].downcase)
        if @user && @user.authenticate(params[:session][:password])
          session[:user_id] = @user.id
          redirect_to home_path
    else
      flash[:alert]= "Suas credencias estão invalidas!"
        render 'new'
    end
  end
  def destroy
    sign_out
    redirect_to root_url
  end
end
