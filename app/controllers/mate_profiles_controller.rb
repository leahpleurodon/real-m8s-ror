# frozen_string_literal: true

class MateProfilesController < ApplicationController
  before_action :set_mate_profile, only: %i[show update destroy edit]
  def show
    render json: @mate_profile
  end

  def update
    if current_user.id != @mate_profile.user_id
      redirect_to '/my_profile' and return
    end
    if @mate_profile.update(mate_profile_params)
      redirect_to '/my_profile' and return
    else
      render :edit
    end
  end

  def edit
    @mate_profile
  end

  private

  def set_mate_profile
    @mate_profile = MateProfile.find(params[:id])
  end

  def mate_profile_params
    params.require(:mate_profile).permit(
      :marital_status, :job, :user_id, :is_smoker, :faith, :personality
    )
  end
end
