# frozen_string_literal: true

class MateReviewsController < ApplicationController
  before_action :notloggedin!
  before_action :set_mate_review, only: %i[show update destroy]

  def create
    if current_user.id == params[:user_id]
      redirect_to '/my_profile' and return
    end
    
    @mate_review = MateReview.new(mate_review_params)
    @mate_review.author_id = current_user.id
    if @mate_review.save
      redirect_to user_path(@mate_review.user_id)
    else
      redirect_to root
    end
  end

  def update
    if current_user.id != @mate_review.author_id
      render deny! and return
    end
    if @mate_review.update(mate_review_params)
      render json: @mate_review
    else
      render json: @mate_review.errors, status: :unprocessable_entity
    end
  end

  private

  def set_mate_review
    @mate_review = MateReview.find(params[:id])
  end

  def mate_review_params
    params.require(:mate_review).permit(
      :rating, :comment, :active, :user_id
    )
  end
end
