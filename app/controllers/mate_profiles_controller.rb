# frozen_string_literal: true

class MateProfilesController < ApplicationController
  before_action :set_mate_profile, only: %i[show update destroy]
  before_action :authorize!
  def show
    render json: @mate_profile
  end

  def update
    if current_user.id != @mate_profile.user_id
      render deny! and return
    end
    if @mate_profile.update(mate_profile_params)
      render json: @mate_profile
    else
      render json: @mate_profile.errors, status: :unprocessable_entity
    end
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
