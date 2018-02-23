module Web::Controllers::Auth0
  class Logout
    include Web::Action

    def call(_params)
      session[:userinfo] = nil
      redirect_to logout_url.to_s
    end

    def logout_url
      domain = ENV["AUTH0_DOMAIN"]
      client_id = ENV["AUTH0_CLIENT_ID"]
      request_params = {
        returnTo: ENV["APP_URL"] || Web.routes.url(:root),
        client_id: client_id,
      }

      URI::HTTPS.build(host: domain, path: "/logout", query: to_query(request_params))
    end

    private

    def to_query(hash)
      hash.map { |k, v| "#{k}=#{CGI.escape(v)}" unless v.nil? }.reject(&:nil?).join("&")
    end
  end
end
