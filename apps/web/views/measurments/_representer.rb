module Web::Views::Measurments
  class Representer
    attr_reader :measurment

    def initialize(measurment)
      @measurment = measurment.to_h
    end

    def base
      {
        id: id,
        device_name: device_name,
        type: type,
        sample: sample,
        spectrum: spectrum,
      }
    end

    private

    def id
      measurment[:id] || ""
    end

    def device_name
      measurment.dig(:measurment_device, :name) || ""
    end

    def type
      measurment[:type] || ""
    end

    def sample
      measurment[:sample] || ""
    end

    def spectrum
      measurment[:spectrum] || []
    end
  end
end
