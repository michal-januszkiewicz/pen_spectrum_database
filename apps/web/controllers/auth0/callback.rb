module Web::Controllers::Auth0
  class Callback
    include Web::Action

    def call(_params)
      user = UseCases::User::Create.call(user_params(request.env["omniauth.auth"]))
      session[:userinfo] = user
      redirect_to "/"
    end

    def authenticate_request!
      # Skip
    end

    private

    def user_params(user_info)
      {
        email: user_info.dig(:info, :email),
        name: user_info.dig(:info, :name),
      }
    end
  end
end
