module ApplicationHelper

    def logged_in?
        !!session[:user_id]
    end

    def current_user
        User.find_by(id: session[:user_id])
    end

    def shared_houses?(other_user)
        my_houses = HouseUser.where(user: current_user).map { |record| record.house_id}
        their_houses = HouseUser.where(user: other_user).map { |record| record.house_id}
        shared = my_houses & their_houses
        shared.empty? ? false : true 
    end 
    def unreviewed?(other_user)
        reviews = MateReview.where(user: other_user, author: current_user)
        reviews.empty?
    end

    def random_color
        [
            '#541388',
            '#7CB518',
            '#D90368',
            '#08BDBD',
            '#F6AE2D'
        ].sample
    end

    def date_of_next(day)
        date  = Date.parse(day)
        delta = date > Date.today ? 0 : 7
        date + delta
    end
end
