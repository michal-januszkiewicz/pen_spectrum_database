require "hanami/validations"

module Validation
  module CustomPredicates
    include Hanami::Validations::Predicates

    self.messages_path = "config/errors.yml"

    predicate(:json_array?) do |input|
      JSON.parse(input).is_a?(Array)
    end
  end
end
