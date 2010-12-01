Weblog::Application.routes.draw do

  root :to => "posts#display"
  resources :posts do
    collection do
      get 'display'
    end
  end
end
