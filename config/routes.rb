Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :classmates, prefix: 'my'

  resources :classmates

  post "/images", to: "images#create", as: "new_image"

  post "/hook", to: 'rsvps#hook'

  resources :events do
    resources :attendees
    resources :rsvps
    resources :event_options
  end

  resources :posts

end
