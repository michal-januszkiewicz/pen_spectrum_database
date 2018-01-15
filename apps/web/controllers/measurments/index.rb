module Web::Controllers::Measurments
  class Index
    include Web::Action

    expose :measurments

    params do
      required(:measurment).schema do
        required(:pen_id).filled
        required(:device_id).filled
      end
    end

    def call(_params)
      @measurments = MeasurmentRepository.new.all_with_pens_and_devices(filters)
    end

    private

    def filters
      {
        pen_id: fetch_param(:pen_id),
        device_id: fetch_param(:device_id),
      }
    end

    def fetch_param(symbol)
      param = params.to_h.dig(:measurment, symbol)
      param == "" ? nil : param
    end
  end
end
