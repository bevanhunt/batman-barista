Emailify::Application.routes.draw do
  root :to => "main#index"
  match '/app/' => redirect('/')
  match '/app' => redirect('/')
  match '/app/*other' => "main#index"
  resources :orders do
    resources :products
  end
  # have to include for rails
  resources :products
  resources :foods
  resources :drinks
end
