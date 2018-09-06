# frozen_string_literal: true

class HousesController < ApplicationController
  before_action :notloggedin!
  before_action :set_house, except: %i[new create my_house join]
  before_action :set_houses
  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)
    @house.join_code = SecureRandom.hex 4
    if @house.save
      redirect_to house_path(@house.id)
    else
      render :new
    end
  end

  def edit
    redirect_to '/join_house'
  end

  def update
    if @house.update(house_params)
      redirect_to house_path(@house.id)
    else
      render :edit
    end
  end

  def my_house
    @house = current_user.houses.first
    
    unless @houses.empty?
        @house_bills = @houses.first.house_bills.where('"house_bills"."id" IN ' + 
        '(SELECT "bill_payments"."house_bill_id" FROM "bill_payments" ' + 
        'WHERE "bill_payments"."paid" = false AND "bill_payments"."active" = true)')
    end
    render :show
  end

  def join

  end

  def all_bills
    unless @houses.empty?
        @house_bills = @houses.first.house_bills.where(active: true)
    end
  end

  def unpaid_bills
    unless @houses.empty?
        @house_bills = @houses.first.house_bills.where('"house_bills"."id" IN ' + 
        '(SELECT "bill_payments"."house_bill_id" FROM "bill_payments" ' + 
        'WHERE "bill_payments"."paid" = false AND "bill_payments"."active" = true)')
    end
  end

  def invite_code

  end

  def chores

  end

  private

  def set_house
    @house = House.find(params[:id] || current_user.houses.first.id)
  end

  def set_houses
    @houses = current_user.houses
  end

  def house_params
    params.require(:house).permit(
      :house_type, :address, :state, :country, :rent_cycle, :rent_start_date, :join_code, :code_expiry_date, :bio, :rent
    )
  end
end
