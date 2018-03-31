module Web::Controllers::Measurments
  class Import
    include Web::Action

    params do
      required(:measurment).schema do
        required(:file).filled
        required(:measurment_device_id).maybe
        required(:comments).maybe
        required(:date).maybe
      end
    end

    def call(params)
      if params.valid?
        Services::Import.call(filename, tempfile, measurment_params)
        redirect_to "/measurments"
      else
        self.status = 422
      end
    end

    private

    def filename
      params[:measurment][:file][:filename]
    end

    def tempfile
      params[:measurment][:file][:tempfile]
    end

    def measurment_params
      {
        measurment_device_id: params[:measurment][:measurment_device_id],
        comments: params[:measurment][:comments],
        date: Date.parse(params[:measurment][:date]),
      }
    end
  end
end
