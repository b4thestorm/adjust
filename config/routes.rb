Rails.application.routes.draw do

 resources :employees, except: [:new] do
 resources :shifts do
 member do
 	post 'notify'
 end
end
end
get '/register', to: 'employees#new'
get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
get '/logout', to: 'sessions#destroy'
get 'bulletin', to: 'shifts#index', as: :bulletin
root to: 'shifts#index'
get '/dashboard', to: 'dashboard#index'
get '/sign_up', to: 'accounts#new', as: :sign_up
post '/accounts', to: 'accounts#create', as: :accounts

end
