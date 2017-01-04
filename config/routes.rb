Rails.application.routes.draw do
  resources :graduates
  root to: "pages#home"

  devise_for :classmates, prefix: 'my'

  resources :classmates

  get "/admin_classmates", to: 'classmates#admin_index', as: "admin_classmates"
  get "/events/:event_id/admin_rsvps", to: 'rsvps#admin_index', as: "admin_rsvps"

  post "/images", to: "images#create", as: "new_image"

  post "/hook", to: 'rsvps#hook'

  resources :events do
    resources :rsvps do
      resources :attendees
    end
    resources :event_options
  end

  resources :posts

end
