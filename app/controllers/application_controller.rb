# frozen_string_literal: true

class ApplicationController < ActionController::Base
    include ApplicationHelper

    def notloggedin!
        redirect_to '/login' and return true if !session[:user_id]
    end

    def my_house?(house)
        HouseUser.where(user: current_user, house: house, active: true).empty? ? false : true
    end

    def is_admin?(house)
        HouseUser.where(user: current_user, house: house, active: true, is_admin: true).empty? ? false : true
    end

    def generate_payments!(bill)
        mates = HouseUser.where(house: bill.house, active: true)
        split_payment = bill.amount / mates.length
        mates.each do |mate|
            byebug
            BillPayment.create(
                user: mate,
                amount_due: split_payment,
                paid: false,
                active: true,
                house_bill: bill,
            )
        end
    end

end
