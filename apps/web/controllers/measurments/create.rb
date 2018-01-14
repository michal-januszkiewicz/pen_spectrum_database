module Web::Controllers::Measurments
  class Create
    include Web::Action

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
      MeasurmentRepository.new.create(measurment_params) if params.valid?
      redirect_to "/measurments"
    end

    private

    def measurment_params
      params[:measurment][:spectrum] = JSON.parse(params[:measurment][:spectrum])
      params[:measurment]
    end
  end
end
