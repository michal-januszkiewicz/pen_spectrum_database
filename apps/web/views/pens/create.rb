module Web::Views::Pens
  class Create
    include Web::View
    include FormHelper
    template "pens/new"
  end
end
