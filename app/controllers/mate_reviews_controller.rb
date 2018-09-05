# frozen_string_literal: true

class MateReviewsController < ApplicationController
  before_action :set_mate_review, only: %i[show update destroy]
  before_action :authorize!
  def show
    render json: @mate_review
  end

  def create
    if current_user.id == params[:user_id]
      render deny! and return
    end
    @mate_review = MateReview.new(mate_review_params)

    if @mate_review.save
      render json: @mate_review, status: :created, location: @mate_review
    else
      render json: @mate_review.errors, status: :unprocessable_entity
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
      :rating, :comment, :active, :author_id, :user_id
    )
  end
end
