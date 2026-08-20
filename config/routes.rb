Rails.application.routes.draw do
  resources :products
  devise_for :users
  root to: "pages#home"
  resources :chats, only: [:show, :index, :create] do
    resources :messages, only: [:create]
  end
end
# product_path(product)
# => /products/1
# # product_url(product)
# https://localhost3000/products/1
