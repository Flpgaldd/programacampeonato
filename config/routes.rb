Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get    'sign_in'   => 'sessions#new'
  post   'sign_in'   => 'sessions#create'
  delete   'sign_out'  => 'sessions#destroy'
  # Defines the root path route ("/")
  # root "posts#index"
  root "home#index"

  get "/home", to: "home#index", as: "home"
 resources :users
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  get '/login', to: 'sessions#new', as: 'login'


  get '/perfil', to: 'perfil#usuario', as: 'perfil'


  get  '/champions/new', to: "champions#new", as: "champions_new"

  post '/champions', to: "champions#create", as: "champions"

  get '/champions/:id', to: "champions#show", as: "champion"

  get '/champions/', to: "champions#index", as: "champions_index"

  put '/champions/edit/:id', to: "champions#edit", as: "champions_put"
end
