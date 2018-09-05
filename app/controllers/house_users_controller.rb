# frozen_string_literal: true

class HouseUsersController < ApplicationController
  before_action :set_house_user, only: %i[show update destroy]
  before_action :authorize!
  def show
    render json: @house_user
  end

  def create
    @house_user = HouseUser.new(house_user_params)
    
    if @house_user.save
      render json: @house_user, status: :created, location: @house_user
    else
      render json: @house_user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @house_user.update(house_user_params)
      render json: @house_user
    else
      render json: @house_user.errors, status: :unprocessable_entity
    end
  end

  private

  def set_house_user
    @house_user = HouseUser.find(params[:id])
  end

  def house_user_params
    params.require(:house_user).permit(
        :is_admin, :active, :house_id, :user_id  
    )
  end
end
  