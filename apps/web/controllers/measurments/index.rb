module Web::Controllers::Measurments
  class Index
    include Web::Action

    expose :measurments

    def call(_params)
      @measurments = MeasurmentRepository.new.all_with_pens
    end
  end
end
