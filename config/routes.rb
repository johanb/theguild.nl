Guild::Application.routes.draw do
  resources :blog, controller: 'posts', except: [:index], as: 'posts'
  resources :events
  root to: "posts#index"
end
