# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  before_action :authorize!, except: %i[create login]

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      MateProfile.create(user: @user)
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def my_profile
    
    @user = User.find(params[:auth_id])
    @profile = MateProfile.where(user: @user).first
    render json: {user: @user, profile: @profile}
  end

  def login
    user = User.find_by(email: params[:email].to_s.downcase)
    
    if user && user.authenticate(params[:password])
        auth_id = user.id.to_s
        render json: {auth_id: auth_id, time: Time.now}, status: :ok
    else
      render json: {error: 'Invalid username / password'}, status: :unauthorized
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :gender, :username, :dob, :profile_pic, :active, :email, :password)
  end
end
