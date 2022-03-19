class Public::MuscleMenusController < ApplicationController
  def index
    @muscle_menu = MuscleMenu.find(params[:id])
  end
end