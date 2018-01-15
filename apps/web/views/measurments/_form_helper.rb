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

    def destroy_measurment_form(id)
      form_for :measurments, routes.measurment_path(id), method: :delete do
        div class: "controls" do
          submit "Delete"
        end
      end
    end
  end
end
