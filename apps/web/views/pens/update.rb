module Web::Views::Pens
  class Update
    include Web::View
    include FormHelper
    template "pens/edit"
  end
end
