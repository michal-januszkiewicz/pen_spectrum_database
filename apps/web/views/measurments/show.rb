module Web::Views::Measurments
  class Show
    include Web::View
    include Chartkick::Helper
    include FormHelper

    def spectrum_chart(spectrum)
      raw line_chart(spectrum)
    end
  end
end
