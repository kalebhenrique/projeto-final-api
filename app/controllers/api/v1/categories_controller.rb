class Api::V1::CategoriesController < ApplicationController
    
    acts_as_token_authentication_handler_for User, only:[:create, :update, :delete]
    before_action :authentication_admin, except: [:index, :show]
    
    def index
        category = Category.all
        render json: category, status: :ok
    end

    def show
        category = Category.find(params[:id])
        render json: category, status: :ok
    rescue StandardError
        head(:not_found)
    end

    def create
        category = Category.new(category_params)
        category.save!
        render json: category, status: :created
    rescue StandardError
        head(:bad_request)
    end
    
    def update
        category = Category.find(params[:id])
        category.update!(category_params)
        render json: category, status: :ok
    rescue StandardError
        head(:bad_request)
    end

    def delete
        category = Category.find(params[:id])
        category.destroy!
        render json: category, status: :ok
    rescue StandardError
        head(:bad_request)
    end
    
    private

    def category_params
        params.require(:category).permit(:name)
    end
end
