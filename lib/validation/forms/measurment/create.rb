require "hanami/validations"
require_relative "../../custom_predicates"

module Validation
  module Forms
    module Measurment
      class Create < Hanami::Action::Params
        predicates CustomPredicates

        validations do
          required(:measurment).schema do
            required(:type).maybe(size?: 2..100)
            required(:pen_id).filled
            required(:measurment_device_id).maybe
            required(:comments).maybe(size?: 2..500)
            required(:spectrum).filled(:json_array?)
            required(:date).filled
          end
        end
      end
    end
  end
end
