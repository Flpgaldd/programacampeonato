require "pry"
class TeamController < ApplicationController
  def new
    @team = Team.new
  end

  def index
    @teams = Team.all
  end

  def create
    @team = current_user.teams.new(team_params)
    if @team.save
      redirect_to @team, flash: { success: "Time criado com sucesso!!" }
    else
      render :new
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to @team, flash: { success: "Time atualizado com sucesso!!" }
    else
      render :edit
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :image, :description, :site, :instagram, :facebook, :linkedin)
  end

  def correct_user
    @team = current_user.teams.find_by(id: params[:id])
    redirect_to team_path, notice: "Você não tem permissão para editar este campeonato" if @team.nil?
  end

end
