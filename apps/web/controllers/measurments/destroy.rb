module Web::Controllers::Measurments
  class Destroy
    include Web::Action

    params do
      required(:id).filled
    end

    def call(params)
      MeasurmentRepository.new.delete(params[:id]) if params.valid?
      redirect_to "/measurments"
    end
  end
end
