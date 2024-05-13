class ChampionsController < ApplicationController
  before_action :authorize
  def create
    @champions = Champions.new(champions_params)

    if @champions.save
      redirect_to @champions, notice: 'Campeonato criado com sucesso!'
    else
      render :new
    end
  end

    def show

    end

    def campeonato

    end

    private

    def championship_params
      params.require(:champions).permit(:name, :start_date, :end_date, :game_type, :description, :rules, :additional_info)
    end

end
