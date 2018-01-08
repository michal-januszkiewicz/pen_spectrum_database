require "csv"
require "tempfile"

module Services
  class ImportPen
    def self.call(pen_name)
      new(pen_name).call
    end

    def initialize(pen_name)
      @pen_name = pen_name
    end

    def call
      UseCases::Pen::Import.call(name: @pen_name)
    end
  end
end
