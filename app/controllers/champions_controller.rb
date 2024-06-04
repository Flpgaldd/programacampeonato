
require "pry"
class ChampionsController < ApplicationController
  before_action :authorize
  def new

  end
  def index
    @steps = [
      { label: 'Step 1' },
      { label: 'Step 2' },
      { label: 'Step 3' },
      { label: 'Step 4' },
      { label: 'Step 5' }
    ]
    @current_step = @steps.first
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
