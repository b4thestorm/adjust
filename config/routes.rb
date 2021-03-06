Rails.application.routes.draw do
 
 resources :employees, except: [:new] do
 post '/message_choice', to: 'employees#message_choice' 
 post '/stop_request', to: 'employees#stop_request'
 resources :shifts do
 member do
 	post 'notify'
  post 'accept'
 end
end
end
get '/register', to: 'employees#new'
get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
get '/logout', to: 'sessions#destroy'
get 'bulletin', to: 'shifts#index', as: :bulletin
############### Constraints for the top routes 
get '/acccounts', to: 'accounts#new', as: :sign_up
post '/accounts', to: 'accounts#create', as: :accounts



root to: 'dashboard#index', as: '/dashboard'


end
