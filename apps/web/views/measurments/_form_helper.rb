module Web::Views::Measurments
  module FormHelper
    def pens
      PenRepository.new.all.each_with_object({}) do |pen, hash|
        hash[pen.name] = pen.id
      end
    end

    def devices
      MeasurmentDeviceRepository.new.all.each_with_object({}) do |device, hash|
        hash[device.name] = device.id
      end
    end
  end
end
