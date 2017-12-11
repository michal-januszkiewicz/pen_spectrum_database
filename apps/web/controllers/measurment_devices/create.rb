module Web::Controllers::MeasurmentDevices
  class Create
    include Web::Action

    params do
      required(:measurment_device).schema do
        required(:name).filled(size?: 2..100)
      end
    end

    def call(params)
      if params.valid?
        MeasurmentDeviceRepository.new.create(params[:measurment_device])
      end
      redirect_to "/measurment_devices"
    end
  end
end
