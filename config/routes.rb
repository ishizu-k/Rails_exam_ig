Rails.application.routes.draw do
  root to: 'users#new'
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
  resources :pictures do
    collection do
      post :confirm
    end
    member do
      patch :confirm
    end
  end
  resources :favorites, only: [:index, :create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
