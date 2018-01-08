module Web::Views::Measurments
  class Index
    include Web::View

    def destroy_measurment_form(id)
      form_for :measurments, routes.measurment_path(id), method: :delete do
        div class: "controls" do
          submit "Delete"
        end
      end
    end
  end
end
