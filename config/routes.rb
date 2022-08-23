Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :offers do
    resources :transactions, only: [:new, :create] # É necessário nestar outro resource, pois serão necessárias duas páginas. Sendo o transactions vinculada a offers. Pra criar uma transaction é preciso atribuir a uma seller_card_id
  end
end
