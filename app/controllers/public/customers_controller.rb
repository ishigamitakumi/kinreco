class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def index
    @customers = Customer.all
  end
  def show
    @customer = Customer.find(params[:id])
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
  def customer_params
    params.require(:customer).permit(:name,:email,:age,:sex,:experience_years,:introduction_text,:profile_image)
  end

end