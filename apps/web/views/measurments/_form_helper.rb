module Web::Views::Measurments
  module FormHelper
    def measurment_form
      form_layout(routes.measurments_path, "Create", :post)
    end

    def edit_measurment_form(id)
      values = { measurment: fetch_measurment(id) }
      form_layout(routes.measurment_path(id), "Update", :patch, values: values)
    end

    def import_form
      form_for :measurment, "/measurments/import", enctype: "multipart/form-data" do
        div class: "form-group" do
          label      :file
          file_field :file, class: "form-control"
        end

        div class: "controls" do
          submit "Import", class: "btn btn-success"
        end
      end
    end

    def destroy_measurment_form(id)
      form_for :measurments, routes.measurment_path(id), method: :delete do
        div class: "controls" do
          submit "Delete", id: "delete-measurment", class: "btn btn-danger destroy-measurment"
        end
      end
    end

    private

    # rubocop:disable Metrics/AbcSize
    # rubocop:disable Metrics/MethodLength
    def form_layout(path, action, method, values: {})
      form_for :measurment, path, method: method, values: values do
        div class: "form-group" do
          label      :type
          select     :type, types, class: "form-control"
        end

        div class: "form-group" do
          label        :sample
          number_field :sample, class: "form-control"
        end

        div class: "form-group" do
          label       :comments
          text_field  :comments, class: "form-control"
        end

        div class: "form-group" do
          label       :pen
          select      :pen_id, pens, class: "form-control"
        end

        div class: "form-group" do
          label       :device
          select      :measurment_device_id, devices, class: "form-control"
        end

        div class: "form-group" do
          label       :date
          date_field  :date, class: "form-control"
        end

        div class: "form-group" do
          label      :spectrum
          text_area  :spectrum, class: "form-control", rows: 15, style: "max-width: 20%"
        end

        div class: "group-controls" do
          div class: "form-group" do
            submit action, class: "btn-success btn"
          end

          div class: "form-group cancel" do
            link_to "Cancel", routes.measurments_path, class: "btn-danger btn"
          end
        end
      end
    end
    # rubocop:enable Metrics/AbcSize
    # rubocop:enable Metrics/MethodLength

    def types
      %w[raw reflective].each_with_object({}) do |type, hash|
        hash[type] = type
      end
    end

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

    def fetch_measurment(id)
      MeasurmentRepository.new.find_by_id(id: id)
    end
  end
end
