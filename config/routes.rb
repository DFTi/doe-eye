DoeEye::Application.routes.draw do
  devise_for :admins
	mount API => '/'

  resources :vendors
end
