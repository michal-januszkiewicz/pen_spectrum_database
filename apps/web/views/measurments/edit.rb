module Web::Views::Measurments
  class Edit
    include Web::View
    include FormHelper

    # rubocop:disable Metrics/AbcSize
    # rubocop:disable Metrics/MethodLength
    def edit_measurment_form(id)
      form_for :measurment, routes.measurment_path(id),
               method: :patch, values: { measurment: measurment(id) } do

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

    private

    def measurment(id)
      MeasurmentRepository.new.find_by_id(id: id)
    end
  end
end
