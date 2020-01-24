class CustumersController < ApplicationController

    def index
        
    end

    def new
        @custumer = Custumer.new
    end

    def create
        @custumer = Custumer.new(custumer_params)

        if @custumer.save
            redirect_to custumers_path, notice: 'Customer successfully registered!'
        else
            render :new
        end
    end

    def custumer_params
        params.require(:custumer).permit(:id, :name, :email, :smoker, :phone, :avatar)
    end
end
