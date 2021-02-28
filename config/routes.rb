Rails.application.routes.draw do
  resources :providers do 
    collection { post :import }
  end
  
  get 'home/index'
	root 'providers#index'
end
