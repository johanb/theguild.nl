Guild::Application.routes.draw do
  devise_for :users
  resources :blog, controller: 'posts', except: [:index], as: 'posts'
  root to: "posts#index"
end
