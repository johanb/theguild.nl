Guild::Application.routes.draw do
  get '/subscribed', to: 'static_pages#subscribed'
  resources :blog, controller: 'posts', except: [:index], as: 'posts'

  root to: "posts#index"
end
