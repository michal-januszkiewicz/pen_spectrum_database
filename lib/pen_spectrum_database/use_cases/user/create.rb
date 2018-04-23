module UseCases
  module User
    class Create < UseCases::Base
      repositories :user

      def self.call(params)
        new(params).call
      end

      def initialize(params)
        @params = params
        @user = user_repository.find_by_email(params[:email])
      end

      def call
        return @user if @user
        user_repository.create(@params)
      end
    end
  end
end
