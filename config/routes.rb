Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root 'json_data#new'
  resources :json_data, except: [:show, :new]

  # Catch all routes /<endpoint> that don't match anything above.
  get "/*endpoint", to: "json_data#show"
end
