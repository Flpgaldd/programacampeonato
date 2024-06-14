
require "pry"
class ChampionsController < ApplicationController
  before_action :authorize
  def new
@champions = Champions.new
  end
  def index
    @champions = Champions.all
  end

  helper_method :progress_classes, :step_classes, :next_step_js

  def progress_classes

  end

  def step_classes(index)

  end

  def next_step_js(back = true)
    "nextStep(#{back})"
  end
  def create
    @champions = Champions.new(championship_params)
      if @champions.save
        redirect_to @champions, flash: {success: "Campeonato criado com sucesso!!"}
      else
        render :new
    end
  end

    def show
      @champions = Champions.find(params[:id])
    end

    private

    def championship_params
      params.require(:champions).permit(:name, :start_date, :end_date, :game_type, :vision, :pontuation, :team, :match_total, :description, :rules, :premiation, :image )
    end

end
