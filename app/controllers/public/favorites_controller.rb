class Public::FavoritesController < ApplicationController
  def create
    @muscle_post = MusclePost.find(params[:muscle_post_id])
    favorite = current_customer.favorites.new(muscle_post_id: @muscle_post.id)
    favorite.save
    redirect_back(fallback_location: root_path)
  end
  def destroy
    @muscle_post = MusclePost.find(params[:muscle_post_id])
    favorite = current_customer.favorites.find_by(muscle_post_id: @muscle_post.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end


end
