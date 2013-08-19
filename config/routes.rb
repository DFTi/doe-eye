DoeEye::Application.routes.draw do
	mount API => '/'

  devise_for :admins

  resources :vendors do
    resources :projects
  end

  root to: "vendor#index"
end