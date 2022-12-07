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
    end
  end
end
