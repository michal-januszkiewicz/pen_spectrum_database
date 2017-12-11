module Web::Views::MeasurmentDevices
  class Edit
    include Web::View

    def edit_device_form(id)
      form_for :measurment_device, routes.measurment_device_path(id), method: :patch do
        div class: "input" do
          label      :name
          text_field :name
        end

        div class: "controls" do
          submit "Update"
        end
      end
    end
  end
end
