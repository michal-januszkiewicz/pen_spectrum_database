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

    # rubocop:disable Metrics/AbcSize
    # rubocop:disable Metrics/MethodLength
    def measurment_form
      form_for :measurment, "/measurments" do
        div class: "form-group" do
          label      :name
          text_field :name, class: "form-control"
        end

        div class: "form-group" do
          label      :type
          text_field :type, class: "form-control"
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
          label      :spectrum
          text_area  :spectrum, class: "form-control", rows: 15, style: "max-width: 20%"
        end

        div class: "controls" do
          submit "Create measurment", class: "btn-success btn"
        end
      end
    end
    # rubocop:enable Metrics/AbcSize
    # rubocop:enable Metrics/MethodLength

    # rubocop:disable Metrics/AbcSize
    # rubocop:disable Metrics/MethodLength
    def edit_measurment_form(id)
      form_for :measurment, routes.measurment_path(id),
               method: :patch, values: { measurment: fetch_measurment(id) } do

        div class: "form-group" do
          label      :name
          text_field :name, value: measurment(id).name, class: "form-control"
        end

        div class: "form-group" do
          label      :type
          text_field :type, class: "form-control"
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
          label      :spectrum
          text_area  :spectrum, class: "form-control", rows: 15, style: "max-width: 20%"
        end

        div class: "controls" do
          submit "Update measurment", class: "btn btn-success"
        end
      end
    end
    # rubocop:enable Metrics/AbcSize
    # rubocop:enable Metrics/MethodLength

    def destroy_measurment_form(id)
      form_for :measurments, routes.measurment_path(id), method: :delete do
        div class: "controls" do
          submit "Delete", class: "btn btn-danger"
        end
      end
    end

    private

    def fetch_measurment(id)
      MeasurmentRepository.new.find_by_id(id: id)
    end
  end
end
