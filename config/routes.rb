Rails.application.routes.draw do

  devise_for :classmates

  root to: "pages#home", as: "home"

  post "/images", to: "images#create", as: "new_image"


  resources :events do
    resources :attendees
    resources :rsvps
    resources :event_options
  end

  resources :posts

end
