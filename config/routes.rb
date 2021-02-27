Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: "users/registrations"
  }

  root 'toppages#index'

  resources :sections
  resources :section_okrs
  resources :key_results
  resources :key_result_comments
  resources :personal_okrs
  resources :section_okr_votes
end
