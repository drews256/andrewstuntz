Rails.application.routes.draw do
  resources :git_first_timers
  root 'home#index'
  get 'resume', to: 'resume#index'
end
