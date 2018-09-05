class UserHouseChoresController < ApplicationController
    before_action :set_user_house_chore, only: %i[show update destroy]
    
    def show
      render json: @user_house_chore
    end
  
    def create
      @user_house_chore = UserHouseChore.new(user_house_chore_params)
      
      if @user_house_chore.save
        render json: @user_house_chore, status: :created, location: @user_house_chore
      else
        render json: @user_house_chore.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @user_house_chore.update(user_house_chore_params)
        render json: @user_house_chore
      else
        render json: @user_house_chore.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_user_house_chore
      @user_house_chore = UserHouseChore.find(params[:id])
    end
  
    def user_house_chore_params
        params.require(:user_house_chore).permit(
            :chore_id, :day_of_week, :frequency, :active, :house_id, :user_id
        )
    end
  end
