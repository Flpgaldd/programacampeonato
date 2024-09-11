class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

    def authorize
      unless current_user
        flash[:alert]= "Você precisa estar logado/cadastrado para acessar a página"
        redirect_to register_path
      end
    end
end
