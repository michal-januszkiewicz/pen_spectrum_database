module Web::Views::Measurments
  class Representer
    attr_reader :measurment

    def initialize(measurment)
      @measurment = measurment.to_h
    end

    def base
      {
        id: measurment[:id] || "",
        pen_name: measurment.dig(:pen, :name) || "",
        device_name: measurment.dig(:measurment_device, :name) || "",
        type: measurment[:type] || "",
        spectrum: measurment[:spectrum] || [],
      }
    end
  end
end
