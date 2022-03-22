class Public::MuscleMenusController < ApplicationController
  def index
    @muscle_menu = MuscleMenu.find(params[:id])
    @muscle_posts = @muscle_menu.muscle_posts.page(params[:page]).per(10).order("id DESC")
  end
end