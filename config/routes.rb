Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "static_pages#index"

  get 'entrar', to: 'sessions#new'
  post 'entrar',  to: 'sessions#create'
  delete 'sair', to: 'sessions#destroy'

  get '/users/:id/tables', to: 'users#tables'

  get 'gastos', to: 'debts#index'
  get 'receitas', to: 'incomes#index'

  #resources :official_sheets do
  #  get '/users/:user_id/official_sheets/:id', to: 'official_sheets#index'
  #end
  get 'usuario', to: 'users#show'

  get '/official_sheets', to:'official_sheets#index'

  get 'tabelas', to: 'official_sheets#index'

  get '/users/:user_id/official_sheets/:id', to: 'official_sheets#index'

  #get 'pagamento',  to: 'static_pages#pagamento'


  resources :users, only: [:show, :new, :create, :edit, :update, :tables] do
    resources :debts, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :incomes, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :official_sheets, only:[:index]
  end


  resources :sessions, only: [:new, :create, :destroy]

end
