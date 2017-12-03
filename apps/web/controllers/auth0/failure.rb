module Web::Controllers::Auth0
  class Failure
    include Web::Action

    def call(_params)
      @error_msg = request.params["message"]
    end

    def authenticate_request!
      # Skip
    end
  end
end
