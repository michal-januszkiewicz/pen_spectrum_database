module Web::Controllers::Measurments
  class Create
    include Web::Action

    params do
      required(:measurment).schema do
        required(:name).filled(size?: 2..100)
      end
    end

    def call(params)
      MeasurmentRepository.new.create(params[:measurment]) if params.valid?
      redirect_to "/measurments"
    end
  end
end
