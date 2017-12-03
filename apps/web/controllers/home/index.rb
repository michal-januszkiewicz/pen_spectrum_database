module Web::Controllers::Home
  class Index
    include Web::Action

    def call(params); end

    def authenticate_request!
      # Skip
    end
  end
end
