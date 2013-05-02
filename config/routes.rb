Guild::Application.routes.draw do
  resources :blog, controller: 'posts', except: [:index], as: 'posts'
  get '/blog.atom' => 'posts#index', format: 'atom', as: 'feed'
  root to: "posts#index"
end
