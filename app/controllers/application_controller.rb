class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

    def authorize
      unless current_user
        flash[:alert]= "Você precisa estar logado para acessar esta página"
        redirect_to root_path
      end
    end
end
