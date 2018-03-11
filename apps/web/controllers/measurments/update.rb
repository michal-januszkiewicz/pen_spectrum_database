module Web::Controllers::Measurments
  class Update
    include Web::Action
    params Validation::Forms::Measurment::Update

    def call(params)
      if params.valid?
        MeasurmentRepository.new.update(params[:id], measurment_params)
        redirect_to "/measurments"
      else
        self.status = 422
      end
    end

    private

    def measurment_params
      params[:measurment][:spectrum] = JSON.parse(params[:measurment][:spectrum])
      params[:measurment]
    end
  end
end
