module Web::Views::Measurments
  class Index
    include Web::View
    include FormHelper

    def filters
      form_for :measurment, routes.measurments_path, class: "form-inline", method: :get do
        div class: "form-group" do
          label       :pen
          select      :pen_id, pens, class: "form-control"
        end

        div class: "form-group" do
          label       :device
          select      :device_id, devices, class: "form-control"
        end

        div class: "form-group" do
          submit "Filter", class: "btn btn-success"
        end
      end
    end

    private

    def pens
      super.merge("None" => nil)
    end

    def devices
      super.merge("None" => nil)
    end
  end
end
