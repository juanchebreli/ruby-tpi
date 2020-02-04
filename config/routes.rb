Rails.application.routes.draw do

  post '/usuarios', to: 'users#create'

  post '/cliente', to: 'clients#create'

  resources :users, param: :_username
  post '/sesiones', to: 'authentication#login'


  get '/productos', to: 'products#productos' 



  get '/productos/:codigo', to: 'products#codigo'

  post '/productos', to: 'products#create' 


  get '/productos/:codigo/items', to: 'products#items'
 

  post '/productos/:codigo/items', to: 'items#create'


  get '/reservas', to: 'reservations#index'


  get '/reservas/:id', to: 'reservations#show'


  post '/reservas' , to:'reservations#create'

  put '/reservas/:id/vender', to:'reservations#sale'
  

  delete '/reservas/:id', to:'reservations#cancelar'


  get '/ventas', to:'sales#sales'


  get '/ventas/:id' , to: 'sales#show'


  post '/ventas', to: 'sales#create'
end
