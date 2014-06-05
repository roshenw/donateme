Rails.application.routes.draw do

  #/campaigns/1/videos/
  resources :admins
  resources :campaigns do
    resources :donations
    resources :videos
  end

  #Authientication
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'welcome#index'


end
