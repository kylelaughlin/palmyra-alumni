Rails.application.routes.draw do
  root to: "pages#home", as: "home"

  devise_for :classmates


  post "/images", to: "images#create", as: "new_image"


  resources :events do
    resources :attendees
    resources :rsvps
    resources :event_options
  end

  resources :posts

end
