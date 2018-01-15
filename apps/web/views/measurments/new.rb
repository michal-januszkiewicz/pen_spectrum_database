module Web::Views::Measurments
  class New
    include Web::View
    include FormHelper

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
  end
end
