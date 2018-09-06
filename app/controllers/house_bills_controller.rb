class HouseBillsController < ApplicationController
    before_action :notloggedin!
    before_action :set_house_bill, only: %i[show update destroy edit]
    def show
      
    end
    def new
        @house_bill = HouseBill.new()
    end
    def create
      @house_bill = HouseBill.new(house_bill_params)
      
      if @house_bill.save
        generate_payments!(@house_bill)
        redirect_to house_bill_path(@house_bill.id)
      else
        render :new
      end
    end

    def edit

    end
  
    def update
        
      if @house_bill.update(house_bill_params)
        if !!params[:images]
            params[:images].each do |img|
                BillImage.create(active: true, house_bill_id: @house_bill.id, image: img )
            end
        end
        redirect_to house_bill_path(@house_bill.id)
      else
            render :edit
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