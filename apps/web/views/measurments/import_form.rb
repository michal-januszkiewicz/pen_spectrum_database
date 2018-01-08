module Web::Views::Measurments
  class ImportForm
    include Web::View

    def import_form
      form_for :measurment, "/measurments/import", enctype: "multipart/form-data" do
        div class: "input" do
          label      :file
          file_field :file
        end

        div class: "controls" do
          submit "Import"
        end
      end
    end
  end
end
