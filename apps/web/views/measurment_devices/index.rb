module Web::Views::MeasurmentDevices
  class Index
    include Web::View

    def destroy_device_form(id)
      form_for :measurment_device, routes.measurment_device_path(id), method: :delete do
        div class: "controls" do
          submit "Delete", class: "btn-primary btn-success btn"
        end
      end
    end
  end
end
