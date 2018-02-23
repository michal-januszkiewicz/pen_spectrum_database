module UseCases
  module Pen
    class Import < UseCases::Base
      repositories :pen

      def self.call(params)
        new(params).call
      end

      def initialize(params)
        @params = params
        @pen = pen_repository.find_by_name(params[:name])
      end

      def call
        return @pen if @pen
        pen_repository.create(@params)
      end
    end
  end
end
