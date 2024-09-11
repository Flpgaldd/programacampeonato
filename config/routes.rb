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

  get '/perfil/edit/:id', to: 'perfil#edit', as: 'perfil_edit'

  patch '/users/update/:id', to: "users#update", as: 'users_update'

  get  '/champion/new', to: "champions#new", as: "champion_new"

  post '/champion/create', to: "champions#create", as: "champion_create"

  get '/champion/:id', to: "champions#show", as: "champion"

  get '/champion/', to: "champions#index", as: "champion_index"

  get '/champion/edit/:id', to: "champions#edit", as: "champion_edit"

  patch '/champion/update/:id', to: "champions#update", as: "champion_update"

  get '/team/new', to: "team#new", as: "team_new"

  post '/team/create', to: "team#create", as: "team_create"

  get '/team/:id', to: "team#show", as: "team"

  get '/team/', to: "team#index", as: "team_index"

  get '/team/edit/:id', to: "team#edit", as: "team_edit"

  patch '/team/update/:id', to: "team#update", as: "team_update"

  get '/membros/', to: "membros#index", as: "membros_index"

  get 'teams/join/:invite_token', to: 'team#join', as: 'invite_team'

  post 'champions/team/', to: 'champions#jointeam', as: 'champions_vs_team'
end
