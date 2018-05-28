Rails.application.routes.draw do
  resources :weekly_goals
  resources :longterm_goals
  resources :integrations
  resources :users
  resources :apps
  resources :categories

  resources :dashboard # TODO Fix
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
