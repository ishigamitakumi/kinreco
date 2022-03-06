class Public::MusclePostsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @muscle_post = MusclePost.new(muscle_post_params)
    @muscle_post.customer = current_customer
    if @muscle_post.save
      redirect_to muscle_post_path(@muscle_post.id)
    else
     redirect_back(fallback_location: root_path)
    end
  end
  def show
    @muscle_post = MusclePost.find(params[:id])
  end

   private
    def muscle_post_params
      params.permit(:muscle_menu_id,:post_image,:sentence,:weight,:times,:body_weight)
    end

end
