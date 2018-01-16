module Web::Controllers::Measurments
  class Create
    include Web::Action

    # expose :error_messages

    params do
      required(:measurment).schema do
        required(:name).maybe(size?: 2..100)
        required(:type).maybe(size?: 2..100)
        required(:pen_id).filled
        required(:measurment_device_id).maybe
        required(:comments).maybe(size?: 2..500)
        required(:spectrum).filled
      end
    end

    def call(params)
      if params.valid?
        MeasurmentRepository.new.create(measurment_params)
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
