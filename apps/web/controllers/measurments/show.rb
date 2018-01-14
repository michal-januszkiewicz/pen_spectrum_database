module Web::Controllers::Measurments
  class Show
    include Web::Action

    expose :measurment

    def call(params)
      @measurment = MeasurmentRepository.new.one_with_pen_and_device(id: params[:id])
    end
  end
end
