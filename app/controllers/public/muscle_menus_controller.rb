class Public::MuscleMenusController < ApplicationController
  def index
    p params
    @muscle_menu = MuscleMenu.find(params[:id])
  end
end