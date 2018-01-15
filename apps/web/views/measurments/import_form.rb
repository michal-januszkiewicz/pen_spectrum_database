module Web::Views::Measurments
  class ImportForm
    include Web::View

    def import_form
      form_for :measurment, "/measurments/import", enctype: "multipart/form-data" do
        div class: "form-group" do
          label      :file
          file_field :file, class: "form-control"
        end

        div class: "controls" do
          submit "Import", class: "btn btn-success"
        end
      end
    end
  end
end
