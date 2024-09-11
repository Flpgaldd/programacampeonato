
require "pry"
class ChampionsController < ApplicationController
  before_action :authorize
  before_action :set_champion, only: [:edit, :update, :show]
  def new
    @champion = Champion.new
  end
  def index
    @champions = Champion.all
  end

  helper_method :progress_classes, :step_classes, :next_step_js

  def progress_classes

  end
  def create
    @champion = Champion.new(championship_params)
    @champion.user_id = current_user.id
    if params[:champion][:image].present?
      @champion.image.attach(params[:champion][:image])
    end

    if @champion.save
      redirect_to @champion, flash: {success: "Campeonato criado com sucesso!!"}
    else
      render :new
    end
  end



  def jointeam
    champion = Champion.find(params["champion_id"])
    team = Team.find(params["team_id"])
    if champion && team
      unless champion.teams.include?(team)
        # Cria uma nova associação para validar
        team_champion = Teamchampion.new(team: team, champion: champion)
        if team_champion.valid?  # Verifica se a validação passa
          if champion.teams.count < 16
            champion.teams << team
            flash[:success] = "Time cadastrado com sucesso!!!"
          else
            flash[:alert] = "Erro ao cadastrar o time: limite de 16 times excedido"
          end
        else
          flash[:alert] = team_champion.errors.full_messages.to_sentence
        end
      else
        flash[:notice] = "O time já está cadastrado neste campeonato."
      end
    else
      flash[:alert] = "Time ou campeonato não existe."
    end

    redirect_to champion
  end

  def step_classes(index)

  end

  def next_step_js(back = true)
    "nextStep(#{back})"
  end
    def show
      @champions = Champion.find(params[:id])
      @teams = @champion.team
    end

    def edit
       @champion
    end

    def update
      if @champion.update(championship_params)
        if params[:champion][:image].present?
          @champion.image.attach(params[:champion][:image])
        end
        redirect_to @champion, notice: 'Campeonato atualizado com sucesso.'
      else
        render :edit
      end
    end
    private

    def championship_params
      params.require(:champion).permit(:name, :start_date, :end_date, :game_type, :vision, :pontuation, :team, :match_total, :description, :rules, :premiation)
    end

    def set_champion
      @champion = Champion.find(params[:id])
    end

    def correct_user
      @champion = current_user.champions.find_by(id: params[:id])
      redirect_to champions_path, notice: "Você não tem permissão para editar este campeonato" if @champion.nil?
    end
end
