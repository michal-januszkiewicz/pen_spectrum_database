module Web::Controllers::Auth0
  class Callback
    include Web::Action

    def call(_params)
      session[:userinfo] = request.env["omniauth.auth"]
      redirect_to "/"
    end

    def authenticate_request!
      # Skip
    end
  end
end
