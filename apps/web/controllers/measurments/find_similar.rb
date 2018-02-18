module Web::Controllers::Measurments
  class FindSimilar
    include Web::Action

    expose :similar

    params do
      required(:id).filled
      optional(:range).filled
    end

    def call(params)
      @similar = MeasurmentRepository.new.find_similar(params)
    end
  end
end
