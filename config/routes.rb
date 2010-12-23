Weblog::Application.routes.draw do
  root :to => "posts#display"

  resources :posts do
    collection do
      get 'display'
      match "tag/:name", :to => "posts#tag", :as => 'by_tag_name'  
    end
  end

  
  resources :sessions
  match '/login',   :to => "sessions#new"
  match '/logout',  :to => "sessions#destroy"
  
  match ':page_name', :to => "static#show"
  
end
