module Web::Views::MeasurmentDevices
  class New
    include Web::View

    def device_form
      form_for :measurment_device, "/measurment_devices" do
        div class: "form-group" do
          label      :name
          text_field :name, class: "form-control"
        end

        div class: "controls" do
          submit "Create device", class: "btn-success btn-primary btn"
        end
      end
    end
  end
end
