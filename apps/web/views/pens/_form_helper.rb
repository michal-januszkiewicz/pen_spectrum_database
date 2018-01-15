module Web::Views::Pens
  module FormHelper
    def destroy_pen_form(id)
      form_for :measurments, routes.measurment_path(id), method: :delete do
        div class: "controls" do
          submit "Delete"
        end
      end
    end
  end
end
