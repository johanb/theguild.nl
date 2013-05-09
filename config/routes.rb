Guild::Application.routes.draw do
  get "members/index"
  devise_for :users

  get '/subscribed', to: 'static_pages#subscribed'

  resources :users, only: :index do
    get 'page/:page', action: :index, on: :collection
  end

  resources :blog, controller: 'posts', except: [:index], as: 'posts'

  get '/blog.atom' => 'posts#index', format: 'atom', as: 'feed'

  resources :events do
    resource :attendance
  end
  root to: "static_pages#homepage"
end
