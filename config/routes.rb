DoeEye::Application.routes.draw do
	mount API => '/'

  devise_for :admins
  resources :document_types
  resources :vendors do
    resources :projects
  end

  root to: "vendor#index"
end