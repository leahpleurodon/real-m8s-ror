# frozen_string_literal: true

class HousesController < ApplicationController
  before_action :set_house, only: %i[show update destroy]
  before_action :authorize!
  
  def show
      render json: @house 
  end

  def create
    @house = House.new(house_params)

    if @house.save
      render json: @house, status: :created, location: @house
    else
      render json: @house.errors, status: :unprocessable_entity
    end
  end

  def update
    if @house.update(house_params)
      render json: @house
    else
      render json: @house.errors, status: :unprocessable_entity
    end
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
