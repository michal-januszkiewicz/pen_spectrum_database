get "/auth/oauth2/callback", to: "auth0#callback"
get "/auth/failure", to: "auth0#failure"
get "/logout", to: "auth0#logout"

root to: "home#index"

resources :measurment_devices
resources :pens
resources :measurments do
  collection do
    get "import_form", to: "measurments#import_form"
    post "import", to: "measurments#import"

    get "find_similar", to: "measurments#find_similar"
  end
end
