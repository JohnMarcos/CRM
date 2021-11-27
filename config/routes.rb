Rails.application.routes.draw do
  get 'prospects/index'
  devise_for :users, skip: [:registrations]

# Recrea las rutas de registro de Devise
   # Actúan sobre un usuario singular (el usuario que inició sesión)
   # Agregue las acciones que desee en 'only:'
   # Es útil para aplicaciones cerradas de uso interno para empresas
  resource :users,
      only: [:edit, :update, :destroy],
      controller: 'devise/registrations',
      as: :user_registration do
    get 'cancel'
  end
root to: 'prospects#index'
  resource :prospects do
    resources :comments
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
