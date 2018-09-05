# frozen_string_literal: true

class HousesController < ApplicationController
  before_action :notloggedin!
  before_action :set_house, only: %i[show update destroy]

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)
    if @house.save
      redirect_to house_path(@house.id)
    else
      render :new
    end
  end

  def edit
    @house
  end

  def update
    if @house.update(house_params)
      redirect_to house_path(@house.id)
    else
      render :edit
    end
  end

  def my_house
    @houses = current_user.houses
    @house_bills = @houses.first.house_bills.where('"house_bills"."id" IN ' + 
        '(SELECT "bill_payments"."house_bill_id" FROM "bill_payments" ' + 
        'WHERE "bill_payments"."paid" = false AND "bill_payments"."active" = true)')
    render :show
  end

  def join

  end

  private

  def set_house
    @house = House.find(params[:id])
  end

  def house_params
    params.require(:house).permit(
      :house_type, :address, :state, :country, :rent_cycle, :rent_start_date, :join_code, :code_expiry_date, :bio, :rent
    )
  end
end
