class CustomersController < ApplicationController

    def index
        
    end

    def show
        @customer = Customer.find(params[:id])
    end

    def new
        @customer = Customer.new
    end

    def create
        @customer = Customer.new(customer_params)

        if @customer.save
            redirect_to customers_path, notice: 'Customer successfully registered!'
        else
            render :new
        end
    end

    def customer_params
        params.require(:customer).permit(:id, :name, :email, :smoker, :phone, :avatar)
    end
end