Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  #/campaigns/1/videos/
  resources :admins
  resources :schools
  resources :users
  resources :campaigns do
    resources :donations
    resources :videos
    resources :images
  end


  root 'welcome#index'
  get '/about', to: 'welcome#about'
  get '/policy', to: 'welcome#policy'
  get '/team', to: 'welcome#team'
  get '/beta', to: 'welcome#beta'
end
