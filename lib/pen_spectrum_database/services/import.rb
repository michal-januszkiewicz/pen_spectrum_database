require "csv"
require "tempfile"

module Services
  class Import
    def self.call(tempfile:, filename:, separator: ";")
      new(tempfile, filename, separator).call
    end

    def initialize(tempfile, filename, separator)
      @file = tempfile
      @filename = filename
      @separator = separator
      @pen_name = ""
      extract_data_from_filename
    end

    def call
      pen = Services::ImportPen.call(@pen_name)
      Services::ImportMeasurment.call(pen.id, @measurment_type, @file, @separator)
    end

    private

    def extract_data_from_filename
      ext = File.extname(@filename)
      filename = File.basename(@filename, ext)
      data = filename.split("(")
      @pen_name = data[0].strip
      @measurment_type = data[1].chomp(")")
    end
  end
end
