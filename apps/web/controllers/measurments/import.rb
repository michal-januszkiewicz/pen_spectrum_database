module Web::Controllers::Measurments
  class Import
    include Web::Action

    params do
      required(:measurment).schema do
        required(:file).filled
      end
    end

    def call(params)
      if params.valid?
        Services::Import.call(import_params)
        redirect_to "/measurments"
      else
        self.status = 422
      end
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
