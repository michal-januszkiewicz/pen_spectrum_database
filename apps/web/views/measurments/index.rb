module Web::Views::Measurments
  class Index
    include Web::View
    include FormHelper
    include Chartkick::Helper

    def filters
      form_for :measurment, routes.measurments_path, method: :get do
        div class: "input" do
          label       :pen
          select      :pen_id, pens
        end

        div class: "input" do
          label       :device
          select      :device_id, devices
        end

        div class: "controls" do
          submit "Filter"
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
