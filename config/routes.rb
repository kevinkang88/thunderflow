DbcOverflow::Application.routes.draw do
  root to: 'questions#index'

  resources :questions do
    resources :answers, only: :create
  end
  resources :answers, except: :create
  resources :votes, only: :create
end