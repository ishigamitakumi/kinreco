class Admin::MuscleMenusController < ApplicationController
  before_action :authenticate_admin!
  def index
    @muscle_menus = MuscleMenu.all
    @muscle_menu = MuscleMenu.new
  end

  def create
    @muscle_menu = MuscleMenu.new(muscle_menu_params)
    @muscle_menu.save
    redirect_back(fallback_location: root_path)
  end
  def edit
    @muscle_menu = MuscleMenu.find(params[:id])
  end
  def update
    @muscle_menu = MuscleMenu.find(params[:id])
    @muscle_menu.update(muscle_menu_params)
    redirect_to  admin_muscle_menus_path
  end
  def destroy
    @muscle_menu = MuscleMenu.find(params[:id])
    @muscle_menu.destroy
    redirect_back(fallback_location: root_path)
  end
  private
  def muscle_menu_params
    params.require(:muscle_menu).permit(:name)
  end
end
