get "/auth/oauth2/callback", to: "auth0#callback"
get "/auth/failure", to: "auth0#failure"
get "/logout", to: "auth0#logout"

root to: "home#index"

resources :measurment_devices
