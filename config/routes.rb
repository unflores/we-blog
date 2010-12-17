Weblog::Application.routes.draw do
  root :to => "posts#display"
  resources :posts do
    collection do
      get 'display'
      match ":name", :to => "posts#tags", :as => 'posts_by_tag_name'
    end

  end
  resources :sessions
  
  match ':page_name', :to => "static#show"
  
end
