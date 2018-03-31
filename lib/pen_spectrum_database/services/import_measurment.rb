require "csv"
require "tempfile"

module Services
  class ImportMeasurment
    def self.call(filepath, params, separator)
      new(filepath, params, separator).call
    end

    def initialize(filepath, params, separator)
      @filepath = filepath
      @params = params
      @separator = separator
    end

    def call
      spectrum = read_csv_file
      UseCases::Measurment::Import.call(@params.merge(spectrum: spectrum))
    end

    private

    def read_csv_file # rubocop:disable Metrics/AbcSize
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

      csv.each_with_object([]) do |row, spectrum|
        spectrum.push([row["lambda"], row["v"]])
      end
    end
  end
end
