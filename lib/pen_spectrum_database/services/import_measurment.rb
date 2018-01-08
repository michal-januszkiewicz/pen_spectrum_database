require "csv"
require "tempfile"

module Services
  class ImportMeasurment
    def self.call(pen_id, type, filepath, separator)
      new(pen_id, type, filepath, separator).call
    end

    def initialize(pen_id, type, filepath, separator)
      @pen_id = pen_id
      @type = type
      @filepath = filepath
      @separator = separator
      @spectrum = []
    end

    def call
      read_csv_file
      UseCases::Measurment::Import.call(measurment_params)
    end

    private

    def measurment_params
      {
        pen_id: @pen_id,
        spectrum: @spectrum,
        type: @type,
      }
    end

    # rubocop:disable Metrics/AbcSize
    def read_csv_file
      # Skip first row
      temp = Tempfile.new
      temp << File.readlines(@filepath)[1..-1].join
      temp.rewind

      csv = CSV.open(
        temp,
        headers: true,
        col_sep: @separator,
        header_converters: ->(f) { f.strip.downcase },
        converters: ->(f) { f.to_s.strip },
      )

      csv.each_with_index do |row, _index|
        @spectrum.push([row["lambda"], row["v"]])
      end
    end
    # rubocop:enable Metrics/AbcSize
  end
end
