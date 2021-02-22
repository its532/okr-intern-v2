Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: "users/registrations"
  }

  root 'toppages#index'

  resources :sections
  resources :section_okrs do
    resources :key_results
    resources :key_result_comments
  end

  resources :personal_okrs do
    resources :key_results
  end
end
