class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :correct_user, only: [:edit, :update]
  def index
    @customers = Customer.where.not(id: current_customer.id).page(params[:page]).per(10) #他のユーザーだけを取得する
  end
  def show
    @customer = Customer.find(params[:id])
    @muscle_posts = @customer.muscle_posts.page(params[:page]).per(5).order("id DESC")
  end
  def edit
    @customer = Customer.find(params[:id])
  end
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      render "edit"
    end
  end
  def  calendar
    @muscle_posts = current_customer.muscle_posts
  end

  def favorites
    @customer = Customer.find(params[:id])
    # favorites= Favorite.where(customer_id: @customer.id).pluck(:muscle_post_id)
    # @favorite_posts = MusclePost.find(favorites).page(params[:page]).per(10)
    @favorite_posts = MusclePost.joins(:favorites).where(favorites:{customer_id: @customer.id}).page(params[:page]).per(10)
    #findメソッドにpageが効かないので変更
  end

  def result
    # @customers = Customer.where(age: params[:age],sex: params[:sex])
    @muscle_posts = MusclePost.includes(:customer).where(customers: {age: params[:age],sex: params[:sex]}).page(params[:page]).per(10)
    @customer = current_customer
  end

  private

    def customer_params
      params.require(:customer).permit(:name,:email,:age,:sex,:experience_years,:introduction_text,:profile_image)
    end
    def correct_user
      @customer = Customer.find(params[:id])
      unless @customer == current_customer
        redirect_to customer_path(current_customer)
      end
    end
end