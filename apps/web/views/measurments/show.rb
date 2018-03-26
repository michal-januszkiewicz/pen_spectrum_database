module Web::Views::Measurments
  class Show
    include Web::View
    include FormHelper

    def measurment
      Representer.new(full_measurment).base
    end
  end
end
