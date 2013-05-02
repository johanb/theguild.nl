Guild::Application.routes.draw do

  get '/subscribed', to: 'static_pages#subscribed'

  resources :blog, controller: 'posts', except: [:index], as: 'posts'

  get '/blog.atom' => 'posts#index', format: 'atom', as: 'feed'

  root to: "posts#index"
end
