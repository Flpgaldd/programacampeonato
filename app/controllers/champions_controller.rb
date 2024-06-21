
require "pry"
class ChampionsController < ApplicationController
  before_action :authorize
  def new
    @champions = Champion.new
  end
  def index
    @champions = Champion.all
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
    @champions = current_user.champions.new(championship_params)
      if @champions.save
        redirect_to @champions, flash: {success: "Campeonato criado com sucesso!!"}
      else
        render :new
    end
  end

    def show
      @champions = Champion.find(params[:id])
    end

    def edit
       @champion = Champion.find(params[:id])
    end

    def update
      @champions = Champion.find(params[:id])
      
      if @champions
        redirect_to @champions, notice: 'Campeonato atualizado com sucesso.'
      else
        render :edit
      end
    end
    private

    def championship_params
      params.require(:champion).permit(:name, :start_date, :end_date, :game_type, :vision, :pontuation, :team, :match_total, :description, :rules, :premiation, :image )
    end

    def set_champion
      @champion = Champion.find(params[:id])
    end

    def correct_user
      @champion = current_user.champions.find_by(id: params[:id])
      redirect_to champions_path, notice: "Você não tem permissão para editar este campeonato" if @champion.nil?
    end
end
