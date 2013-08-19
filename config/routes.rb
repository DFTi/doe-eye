DoeEye::Application.routes.draw do
	mount API => '/'

  devise_for :admins

  resources :vendors

  root to: "vendor#index"
end