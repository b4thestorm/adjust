Rails.application.routes.draw do
 
 resources :employees, except: [:new] do
 resources :shifts do
 member do
 	post 'notify'
  post 'accept'
 end
end
end
root to: 'employees#new', as: :register
get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
get '/logout', to: 'sessions#destroy'
get 'bulletin', to: 'shifts#index', as: :bulletin
############### Constraints for the top routes 
get '/acccounts', to: 'accounts#new', as: :sign_up
post '/accounts', to: 'accounts#create', as: :accounts



get '/dashboard', to: 'dashboard#index'


end
