Rails.application.routes.draw do
  root 'toppages#index'
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: "users/registrations"
  }
end
