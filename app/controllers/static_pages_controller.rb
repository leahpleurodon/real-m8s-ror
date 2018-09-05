class StaticPagesController < ApplicationController

    def index
        redirect_to '/my_profile' and return if !!session[:user_id]
        render :layout => false
    end
end