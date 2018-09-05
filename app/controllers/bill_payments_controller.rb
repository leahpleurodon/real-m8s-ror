class BillPaymentsController < ApplicationController
    before_action :notloggedin!
    before_action :set_bill_payment, only: %i[show update destroy]
    def show
      render json: @bill_payment
    end
  
    def create
      @bill_payment = BillPayment.new(bill_payment_params)
      
      if @bill_payment.save
        render json: @bill_payment, status: :created, location: @bill_payment
      else
        render json: @bill_payment.errors, status: :unprocessable_entity
      end
    end
  
    def update

      if @bill_payment.update(bill_payment_params)
        render json: @bill_payment
      else
        render json: @bill_payment.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_bill_payment
      @bill_payment = BillPayment.find(params[:id])
    end
  
    def bill_payment_params
        params.require(:bill_payment).permit(
            :user_id, :amount_due, :paid, :due_date, :active, :house_bill_id
        )
    end
end