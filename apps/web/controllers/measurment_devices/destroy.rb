module Web::Controllers::MeasurmentDevices
  class Destroy
    include Web::Action

    params do
      required(:id).filled
    end

    def call(params)
      MeasurmentDeviceRepository.new.delete(params[:id]) if params.valid?
      redirect_to "/measurment_devices"
    end
  end
end
