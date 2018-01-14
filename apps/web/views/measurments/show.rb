module Web::Views::Measurments
  class Show
    include Web::View
    include Chartkick::Helper

    def spectrum_chart(spectrum)
      raw line_chart(spectrum)
    end

    def destroy_measurment_form(id)
      form_for :measurments, routes.measurment_path(id), method: :delete do
        div class: "controls" do
          submit "Delete"
        end
      end
    end
  end
end
