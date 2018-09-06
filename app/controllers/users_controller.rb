# frozen_string_literal: true
class UsersController < ApplicationController
    before_action :notloggedin!, except: %i[create new login new_session]
    before_action :set_user, only: %i[show update reviews destroy]

  def show
    @user
  end

  def reviews
    @reviews = @user.mate_reviews
    @overall_rating = @reviews.average(:rating)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      profile = MateProfile.create(user: @user)
      session[:user_id] = @user.id
      redirect_to edit_mate_profile_path(profile.id)
    else
        render :new,  :layout => false
    end
  end

  def new
    redirect_to '/my_profile' and return if !!session[:user_id]
    @user = User.new()
    render :layout => false
  end

  def edit

  end
  def update
    @user.update(user_params)
    redirect_to '/my_profile'
  end

  def my_profile
    
    @user = current_user
    render :show
  end

  def login
    redirect_to '/my_profile' and return if !!session[:user_id]
    render :layout => false
  end

  def new_session
    user = User.find_by(email: params[:email].to_s.downcase)
    
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to :my_profile
    else
      @error = "Wrong email/password combo"
      render :login, :layout => false
    end
  end

  def delete_session
    session[:user_id] = nil
    redirect_to "/"
  end
  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :gender, :username, :dob, :profile_pic, :active, :email, :password)
  end
end
