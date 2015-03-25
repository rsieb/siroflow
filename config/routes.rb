Rails.application.routes.draw do
  devise_for :admins
  resources :assignments
  get 'home/index'

  devise_for :users

  # 2. Ensure you have defined root_url to *something* in your config/routes.rb.
  #    For example:
  #      root to: "home#index"
  root to: "home#index"

end
