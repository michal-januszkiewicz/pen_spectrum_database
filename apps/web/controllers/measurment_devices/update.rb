module Web::Controllers::MeasurmentDevices
  class Update
    include Web::Action

    params do
      required(:id).filled(:str?)
      required(:measurment_device).schema do
        required(:name).filled(size?: 2..100)
      end
    end

    def call(params)
      if params.valid?
        MeasurmentDeviceRepository.new.update(params[:id], params[:measurment_device])
        redirect_to "/measurment_devices"
      else
        self.status = 422
      end
    end
  end
end
