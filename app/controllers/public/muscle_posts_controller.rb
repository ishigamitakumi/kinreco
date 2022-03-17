class Public::MusclePostsController < ApplicationController
  before_action :authenticate_customer!
  before_action :correct_user, only: [:edit, :update]

  def new
    @muscle_post = MusclePost.new
  end
  def create
    @muscle_post = MusclePost.new(muscle_post_params)
    @muscle_post.customer = current_customer
    if @muscle_post.save
      redirect_to muscle_post_path(@muscle_post.id)
    else
     render "new"
    end
  end

  def show
    @muscle_post = MusclePost.find(params[:id])
  end

  def index
    @muscle_posts = MusclePost.where.not(id: current_customer.muscle_posts.ids).page(params[:page]).per(7) #他のユーザーの投稿だけを取得する
  end

  def edit
    @muscle_post = MusclePost.find(params[:id])
  end

  def update
     @muscle_post = MusclePost.find(params[:id])
    if @muscle_post.update(muscle_post_params)
      redirect_to muscle_post_path(@muscle_post)
    else
      render "edit"
    end
  end

  def destroy
    @muscle_post = MusclePost.find(params[:id])
    @muscle_post.destroy
    redirect_to muscle_posts_path
  end

  def tl
    @customer = Customer.find(current_customer.id)

    muscle_post_ids = []
    @customer.followings.each do |follow|
      follow.muscle_posts.each do |muscle_post|
        muscle_post_ids.push(muscle_post.id)
      end
    end
    muscle_post_ids = muscle_post_ids.sort_by{|x| x}
    @muscle_posts = MusclePost.find(muscle_post_ids).last(10)
  end

   private

    def muscle_post_params
      params.require(:muscle_post).permit(:muscle_menu_id,:post_image,:sentence,:weight,:times,:body_weight,:start_time)
    end

    def correct_user
    @muscle_post = MusclePost.find(params[:id])
    @customer = @muscle_post.customer
    redirect_to(muscle_posts_path) unless @customer == current_customer
    end

end
