Guild::Application.routes.draw do
  get "members/index"
  devise_for :users

  get '/subscribed', to: 'static_pages#subscribed'

  resources :users, only: :index do
    get 'page/:page', action: :index, on: :collection
  end

  resources :blog, controller: 'posts', except: [:index], as: 'posts'

  get '/blog.atom' => 'posts#index', format: 'atom', as: 'feed'

  root to: "posts#index"
end
