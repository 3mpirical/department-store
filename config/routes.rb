Rails.application.routes.draw do
  root "pages#home"
  get "/about" => "pages#about"


  resources :stores do
    resources :items
  end

  get "/stores/:store_id/items/new" => "items#new"
end
