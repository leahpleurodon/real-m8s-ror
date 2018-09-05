class HouseBillsController < ApplicationController
    before_action :notloggedin!
    before_action :set_house_bill, only: %i[show update destroy]
    def show
      render json: @house_bill
    end
  
    def create
      @house_bill = HouseBill.new(house_bill_params)
      
      if @house_bill.save
        generate_payments!(@house_bill)
        render json: @house_bill, status: :created, location: @house_bill
      else
        render json: @house_bill.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @house_bill.update(house_bill_params)
        render json: @house_bill
      else
        render json: @house_bill.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_house_bill
      @house_bill = HouseBill.find(params[:id])
    end
  
    def house_bill_params
        params.require(:house_bill).permit(
            :desc, :due_date, :amount, :active, :user_id, :house_id, :category
        )
    end
end