class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customers = Customer.page(params[:page]).per(5)
  end
  def show
    @customer = Customer.find(params[:id])
  end
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to root_path
  end
end
