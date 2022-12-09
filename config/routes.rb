Rails.application.routes.draw do
  devise_for :users, skip: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      scope 'users' do
        get 'login', to: 'users#login'
        get 'logout', to: 'users#logout'
      end
      scope 'brands' do
        get 'index', to: 'brands#index'
        get 'show/:id', to: 'brands#show'
        post 'create', to: 'brands#create'
        patch 'update/:id', to: 'brands#update'
        delete 'delete/:id', to: 'brands#delete'
      end
      scope 'categories' do
        get 'index', to: 'categories#index'
        get 'show/:id', to: 'categories#show'
        post 'create', to: 'categories#create'
        patch 'update/:id', to: 'categories#update'
        delete 'delete/:id', to: 'categories#delete'
      end
      scope 'products' do
        get 'index', to: 'products#index'
        get 'show/:id', to: 'products#show'
        post 'create', to: 'products#create'
        patch 'update/:id', to: 'products#update'
        delete 'delete/:id', to: 'products#delete'
      end
    end
  end
end
