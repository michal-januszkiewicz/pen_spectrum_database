module UseCases
  module Measurment
    class Import < UseCases::Base
      repositories :measurment

      def self.call(params)
        new(params).call
      end

      def initialize(params)
        @params = params
      end

      def call
        return if type_exists?
        measurment_repository.create(@params)
      end

      private

      def type_exists?
        measurment_repository.find_by_type_and_sample_for_pen(
          type: @params[:type], sample: @params[:sample], pen_id: @params[:pen_id],
        )
      end
    end
  end
end
