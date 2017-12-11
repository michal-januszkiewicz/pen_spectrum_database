module Web::Views::MeasurmentDevices
  class New
    include Web::View

    def device_form
      form_for :measurment_device, "/measurment_devices" do
        div class: "input" do
          label      :name
          text_field :name
        end

        div class: "controls" do
          submit "Create device"
        end
      end
    end
  end
end
