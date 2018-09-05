class BillImagesController < ApplicationController
    before_action :authorize!
    before_action :set_bill_image, only: %i[show]

    def show
        unless my_house?(@bill_image.house)
            render deny! and return
        end
        render json: @bill_image
    end

    def set_bill_image
        @bill_image = BillImage.find(params[:id])
    end
end
