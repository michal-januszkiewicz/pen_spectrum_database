module Web::Controllers::Measurments
  class Create
    include Web::Action
    params Validation::Forms::Measurment::Create

    def call(params)
      if params.valid?
        MeasurmentRepository.new.create(measurment_params)
        redirect_to "/measurments"
      else
        self.status = 422
      end
    end

    private

    def measurment_params
      params[:measurment].merge(
        date: parse_date(params[:measurment][:date]),
        spectrum: parse_spectrum,
        user_id: current_user.id,
      )
    end

    def parse_spectrum
      rows = params[:measurment][:spectrum].split("\r\n")
      rows.map! { |row| row.split("\t") }
    end

    def parse_date(date)
      date ? Date.parse(date) : nil
    end
  end
end
