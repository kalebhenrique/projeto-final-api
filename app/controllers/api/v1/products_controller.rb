class Api::V1::ProductsController < ApplicationController
    acts_as_token_authentication_handler_for User, only:[:create,:update,:delete]
    
    before_action :authentication_admin, except: [:index, :index_by_category, :show]
    
    def index
        product = Product.all
        render json: product, status: :ok
    end

    def index_by_category
        product = Product.where(category_id: params[:id])
        render json: product, status: :ok
    rescue StandardError
        head(:not_found)
    end

    def show
        product = Product.find(params[:id])
        render json: product, status: :ok
    rescue StandardError
        head(:not_found)
    end

    def create
        product = Product.new(product_params)
        product.save!
        render json: product, status: :created
    rescue StandardError
        head(:bad_request)
    end
    
    def update
        product = Product.find(params[:id])
        product.update!(product_params)
        render json: product, status: :ok
    rescue StandardError
        head(:bad_request)
    end

    def delete
        product = Product.find(params[:id])
        product.destroy!
        render json: product, status: :ok
    rescue StandardError
        head(:bad_request)
    end
    
    private

    def product_params
        params.require(:product).permit(
            :name,
            :description, 
            :inventory, 
            :price_in_cents,
            :category_id, 
            :brand_id,
            images: []
        )
    end
end
