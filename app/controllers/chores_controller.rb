class ChoresController < ApplicationController
    before_action :set_chore, only: %i[show]
    def show
      render json: @chore
    end
  
    def create
      @chore = Chore.create(chore_params)
    end
  
  
    private
  
    def set_chore
      @chore = Chore.find(params[:id])
    end
  
    def chore_params
        params.require(:chore).permit(
            :name, :outdoor, :active
        )
    end
end