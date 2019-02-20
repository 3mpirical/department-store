Rails.application.routes.draw do
  root "pages#home"
  get "/about" => "pages#about"

  resources :store do
    resources :item
  end
end
