# frozen_string_literal: true

class ApplicationController < ActionController::API

    def authenticated?
        user = User.find_by(id: params[:auth_id])
        user ? true : false
    end

    def current_user
        User.find_by(id: params[:auth_id])
    end

    def authorize!
        deny! unless authenticated?
    end

    def my_house?(house)
        HouseUser.where(user: current_user, house: house, active: true).empty? ? false : true
    end

    def is_admin?(house)
        HouseUser.where(user: current_user, house: house, active: true, is_admin: true).empty? ? false : true
    end

    def deny!
        {json: {error: 'Unauthorised'}, status: 401}
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
