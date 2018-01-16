module Web::Views::Measurments
  class Import
    include Web::View
    include FormHelper
    template "measurments/import_form"
  end
end
