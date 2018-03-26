module Web::Controllers::Measurments
  class Show
    include Web::Action

    expose :full_measurment

    def call(params)
      @full_measurment = MeasurmentRepository.new.one_with_pen_and_device(id: params[:id])
    end
  end
end
