Rails.application.routes.draw do

  resources :chin_wags
  root to: 'file_uploads#index'

  resources :file_uploads
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
