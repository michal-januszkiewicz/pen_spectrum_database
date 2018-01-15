module Web::Views::Pens
  module FormHelper
    def destroy_pen_form(id)
      form_for :pens, routes.pen_path(id), method: :delete do
        div class: "controls" do
          submit "Delete", class: "btn btn-success btn-md"
        end
      end
    end
  end
end
