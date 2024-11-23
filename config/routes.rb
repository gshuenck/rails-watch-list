# config/routes.rb
Rails.application.routes.draw do
  resources :lists do
    resources :bookmarks do
      resources :reviews, only: [:new, :create, :show, :destroy]
    end
  end
  root "lists#index"
end
