Rails.application.routes.draw do
  root 'home#index'
  get 'resume', to: 'resume#index'
end
