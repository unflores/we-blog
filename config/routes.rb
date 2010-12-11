Weblog::Application.routes.draw do
  root :to => "posts#display"
  resources :posts do
    collection do
      get 'display'
    end
  end
  resources :sessions
  
  match ':page_name', :to => "static#show"
  
end
