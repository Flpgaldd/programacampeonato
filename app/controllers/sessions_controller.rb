class SessionsController < ApplicationController
  before_action :block_access, except: [:destroy]
  def new

  end
  def create
        @user = User.find_by(email: params[:session][:email].downcase)
        if @user && @user.authenticate(params[:session][:password])
          session[:user_id] = @user.id
          redirect_to @user
    else
        render 'new'
    end
  end
  def destroy
    sign_out
    redirect_to root_url
  end
end