require "csv"
require "tempfile"

module Services
  class Import
    def self.call(filename, tempfile, measurment_params, separator: ";")
      new(filename, tempfile, measurment_params, separator).call
    end

    def initialize(filename, tempfile, measurment_params, separator)
      @measurment_params = measurment_params
      @separator = separator
      @filepath = tempfile
      data = extract_data_from_filename(filename)
      @pen_name = fetch_pen_name(data)
      @measurment_params[:sample], @measurment_params[:type] = fetch_measurment_sample_and_type(
        data,
      )
    end

    def call
      pen = Services::ImportPen.call(@pen_name)
      Services::ImportMeasurment.call(
        @filepath, @measurment_params.merge(pen_id: pen.id), @separator
      )
    end

    private

    def extract_data_from_filename(filename)
      ext = File.extname(filename)
      filename = File.basename(filename, ext)
      filename.split("(")
    end

    def fetch_pen_name(data)
      data[0].strip
    end

    def fetch_measurment_sample_and_type(data)
      data[1].chomp(")").split(" ")
    end
  end
end
