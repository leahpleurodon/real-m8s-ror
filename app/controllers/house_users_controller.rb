# frozen_string_literal: true

class HouseUsersController < ApplicationController
  before_action :set_house_user, only: %i[show update destroy]
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

  def join_house
    redirect_to '/join_house' if !params[:join_code]
    house = House.where(join_code: params[:join_code]).first
    HouseUser.where(user: current_user).each do |hu|
        hu.active = false
        hu.save
    end
    membership = HouseUser.new(house: house, user:current_user, active:true)
    house.join_code = SecureRandom.hex 4
    house.save
    if membership.save
        redirect_to '/my_house'
    else
        redirect_to '/join_house'
    end
  end

  def leave_house
    HouseUser.where(user: current_user).each do |hu|
        hu.active = false
        hu.save
    end
    redirect_to '/my_profile'
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
  