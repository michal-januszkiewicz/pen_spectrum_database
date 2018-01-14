module Web::Controllers::Measurments
  class Show
    include Web::Action

    expose :measurment

    def call(params)
      @measurment = MeasurmentRepository.new.one_with_pen(id: params[:id])
    end
  end
end
