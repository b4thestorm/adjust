Rails.application.routes.draw do
 
 resources :employees, except: [:new] do
 resources :shifts do
 member do
 	post 'notify'
 end
end
end
resources :employee_shifts
get '/register', to: 'employees#new'
get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
get '/logout', to: 'sessions#destroy'
get 'bulletin', to: 'shifts#index', as: :bulletin
root to: 'shifts#index'

end
