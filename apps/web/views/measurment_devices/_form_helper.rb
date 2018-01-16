module Web::Views::MeasurmentDevices
  module FormHelper
    def device_form
      form_layout(routes.measurment_devices_path, "Create", :post)
    end

    def edit_device_form(id)
      values = { measurment_device: fetch_measurment_device(id) }
      form_layout(routes.measurment_device_path(id), "Update", :patch, values: values)
    end

    private

    def form_layout(path, action, method, values: {})
      form_for :measurment_device, path,
               method: method, values: values do

        div class: "form-group" do
          label      :name
          text_field :name, class: "form-control"
        end

        div class: "controls" do
          submit action, class: "btn-success btn"
        end
      end
    end

    def fetch_measurment_device(id)
      MeasurmentDeviceRepository.new.find_by_id(id: id)
    end
  end
end
