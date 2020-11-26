Rails.application.routes.draw do
  resources :contacts, only: [:index, :show]
  devise_for :users
  root "application#index"
  get '*path' => redirect('/')
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
