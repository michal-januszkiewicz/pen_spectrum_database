module Web::Controllers::MeasurmentDevices
  class Index
    include Web::Action

    expose :measurment_devices

    def call(_params)
      @measurment_devices = MeasurmentDeviceRepository.new.all
    end
  end
end
