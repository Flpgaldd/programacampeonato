class HomeController < ApplicationController
  def index
    @champions= Champion.all
  end
end
