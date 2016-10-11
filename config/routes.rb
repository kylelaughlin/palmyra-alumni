Rails.application.routes.draw do
  devise_for :classmates
  resources :posts
  root to: "pages#home", as: "home"
  post "/images", to: "images#create", as: "new_image"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
