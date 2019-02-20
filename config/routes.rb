Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	resources :restaurant
  	resources :user
  	post 'restaurant/verify', to: 'restaurant#verify'
    post 'authenticate', to: 'authentication#authenticate'
    post 'user/verify', to: 'user#verify'
    
end
