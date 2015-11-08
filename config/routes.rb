Rails.application.routes.draw do
  post '/register' => 'auth#register'
  # patch '/confirm' => 'auth#confirm'
  post '/login' => 'auth#login'
  delete '/logout/:id' => 'auth#logout'

  resources :properties, except:[:new, :edit]

  resources :activities, except:[:new, :edit]

  resources :users, except: [:new, :edit]

  resources :books, except: [:new, :edit]
end
