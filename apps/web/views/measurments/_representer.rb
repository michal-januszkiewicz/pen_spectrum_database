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
        pen_name: pen_name,
        type: type,
        sample: sample,
        spectrum: spectrum,
        date: date,
      }
    end

    private

    def id
      measurment[:id] || ""
    end

    def device_name
      measurment.dig(:measurment_device, :name) || ""
    end

    def pen_name
      measurment.dig(:pen, :name) || ""
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

    def date
      measurment[:date]&.to_date || ""
    end
  end
end
