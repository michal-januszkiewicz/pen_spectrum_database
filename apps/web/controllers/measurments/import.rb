module Web::Controllers::Measurments
  class Import
    include Web::Action

    params do
      required(:measurment).schema do
        required(:file).filled
      end
    end

    def call(params)
      Services::Import.call(import_params) if params.valid?
      redirect_to "/measurments"
    end

    private

    def import_params
      {
        tempfile: params[:measurment][:file][:tempfile],
        filename: params[:measurment][:file][:filename],
      }
    end
  end
end
