module Web::Controllers::Measurments
  class Update
    include Web::Action

    params do
      required(:id).filled
      required(:measurment).schema do
        required(:name).maybe(size?: 2..100)
        required(:type).maybe(size?: 2..100)
        required(:pen_id).filled
        required(:comments).maybe(size?: 2..500)
        required(:spectrum).filled
      end
    end

    def call(params)
      MeasurmentRepository.new.update(params[:id], measurment_params)
      redirect_to "/measurments"
    end

    private

    def measurment_params
      params[:measurment][:spectrum] = JSON.parse(params[:measurment][:spectrum])
      params[:measurment]
    end
  end
end