module Web::Views::MeasurmentDevices
  module FormHelper
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

    def edit_device_form(id)
      form_for :measurment_device, routes.measurment_device_path(id),
               method: :patch, values: { measurment_device: measurment_device(id) } do

        div class: "form-group" do
          label      :name
          text_field :name, class: "form-control"
        end

        div class: "controls" do
          submit "Update", class: "btn-success btn-primary btn"
        end
      end
    end

    private

    def measurment_device(id)
      MeasurmentDeviceRepository.new.find_by_id(id: id)
    end
  end
end
