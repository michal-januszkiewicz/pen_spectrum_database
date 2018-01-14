module Web::Views::Pens
  class Index
    include Web::View

    def destroy_pen_form(id)
      form_for :pen, routes.pen_path(id), method: :delete do
        div class: "controls" do
          submit "Delete"
        end
      end
    end
  end
end
