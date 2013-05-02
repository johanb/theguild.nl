Guild::Application.routes.draw do

  namespace :admin do
    resources :invitations, only: [:index, :create]
  end

  get '/users/register/:token' => 'user_registrations#new', as: :user_registration

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get '/subscribed', to: 'static_pages#subscribed'

  resources :blog, controller: 'posts', except: [:index], as: 'posts'

  get '/blog.atom' => 'posts#index', format: 'atom', as: 'feed'

  root to: "posts#index"
end
