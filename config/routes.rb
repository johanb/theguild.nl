Guild::Application.routes.draw do
  devise_for :users

  get '/subscribed', to: 'static_pages#subscribed'

  resources :blog, controller: 'posts', except: [:index], as: 'posts'

  get '/blog.atom' => 'posts#index', format: 'atom', as: 'feed'

  resources :events
  root to: "posts#index"
end
