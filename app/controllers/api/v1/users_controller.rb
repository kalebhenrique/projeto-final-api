class Api::V1::UsersController < ApplicationController
    acts_as_token_authentication_handler_for User, only: [:logout, :show, :update, :update_password, :delete]
    
    before_action :authentication_admin, only: [:index]
    
    def index
        render json: user = User.all, status: :ok
    end

    def show
        user = User.find(params[:id])
        render json: user, status: :ok
    rescue StandardError
        head(:not_found)
    end

    def create
        render json: User.create!(user_create_params), status: :created
    rescue ActiveRecord::RecordInvalid => e
        render json: {message: e.message}, status: :unprocessable_entity
    end
    
    def update
        user = User.find(params[:id])
        user.update!(user_update_params)
        render json: user, status: :ok
    rescue ActiveRecord::RecordInvalid => e
        render json: {message: e.message}, status: :unprocessable_entity
    rescue ActiveRecord::RecordNotFound => e
        render json: {message: e.message}, status: :not_found
    end

    def update_password
        user = User.find(params[:id])
        user.update!(user_update_password_params)
        render json: user, status: :ok
    rescue ActiveRecord::RecordInvalid => e
        render json: {message: e.message}, status: :unprocessable_entity
    rescue ActiveRecord::RecordNotFound => e
        render json: {message: e.message}, status: :not_found
    end

    def delete
        user = User.find(params[:id])
        user.destroy!
        render json: user, status: :ok
    rescue StandardError
        head(:bad_request)
    end
    
    def login 
        user = User.find_by!(email: params[:email])
        if user.valid_password?(params[:password])
            render json: user, status: :ok
        else
            head(:unauthorized)
        end
    rescue StandardError => e 
        render json: {message: e.message}, status: :unauthorized
    end

    def logout
        current_user.authentication_token = nil
        current_user.save!
        head(:ok)
    rescue StandardError => e 
        render json: {message: e.message}, status: :bad_request
    end

    private

    def user_create_params
        params.require(:user).permit(
            :name, 
            :email, 
            :phone, 
            :password, 
            :password_confirmation, 
            :is_admin, 
            :credit,
            :profile_picture
        )
    end

    def user_update_params
        params.require(:user).permit(:name, :phone, :profile_picture)
    end

    def user_update_password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end
