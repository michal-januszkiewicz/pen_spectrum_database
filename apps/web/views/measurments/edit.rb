module Web::Views::Measurments
  class Edit
    include Web::View
    include FormHelper

    # rubocop:disable Metrics/AbcSize
    # rubocop:disable Metrics/MethodLength
    def edit_measurment_form(id)
      form_for :measurment, routes.measurment_path(id),
               method: :patch, values: { measurment: measurment(id) } do

        div class: "input" do
          label      :name
          text_field :name, value: measurment(id).name
        end

        div class: "input" do
          label      :type
          text_field :type
        end

        div class: "input" do
          label       :comments
          text_field  :comments
        end

        div class: "input" do
          label       :pen
          select      :pen_id, pens
        end

        div class: "input" do
          label       :device
          select      :measurment_device_id, devices
        end

        div class: "input" do
          label      :spectrum
          text_area  :spectrum
        end

        div class: "controls" do
          submit "Update measurment"
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
