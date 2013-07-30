DoeEye::Application.routes.draw do
	mount API => '/'

  resources :vendors
end
