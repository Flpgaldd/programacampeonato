
require "pry"
class ChampionsController < ApplicationController
  before_action :authorize
  def new

  end
  def index

  end
  def create
    binding.pry
    @champions = Champions.new(championship_params)
      if @champions.save
        redirect_to @champions, flash: {success: "Campeonato criado com sucesso!!"}
      else
        render :new
    end
  end

    def show

    end

    private

    def championship_params
      params.permit(:name, :start_date, :end_date, :game_type, :description, :rules, :additional_info)
    end

end
