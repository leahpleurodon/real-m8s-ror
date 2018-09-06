class BillPaymentsController < ApplicationController
    before_action :notloggedin!
    before_action :set_bill_payment, only: %i[show update destroy]
  
    def update
        @bill_payment.update(bill_payment_params)
        redirect_to '/my_house'
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