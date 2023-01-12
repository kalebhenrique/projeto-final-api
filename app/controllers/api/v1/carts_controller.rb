class Api::V1::CartsController < ApplicationController
    acts_as_token_authentication_handler_for User
    before_action :verify_user, only: (:show)

    def show
        cart = Cart.where(user_id: params[:id])
        render json: cart, status: :ok
    rescue StandardError
        head(:not_found)
    end

    def create
        cart = Cart.new(cart_params)
        cart.save!
        render json: cart, status: :created
    rescue StandardError
        head(:bad_request)
    end

    def delete
        cart = Cart.find(params[:id])
        cart.destroy!
        render json: cart, status: :ok
    rescue StandardError
        head(:bad_request)
    end
    
    private

    def verify_user
        head(:unauthorized) unless current_user.id.to_s == (params[:id])
    end

    def cart_params
        params.require(:cart).permit(
            :product_id, 
            :user_id)
    end
end
