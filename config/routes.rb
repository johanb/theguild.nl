Guild::Application.routes.draw do
  resources :blog, controller: 'posts', except: [:index], as: 'posts'
  root to: "posts#index"
end
