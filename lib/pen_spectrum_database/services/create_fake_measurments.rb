module Services
  class CreateFakeMeasurments
    def self.call(n)
      new(n).call
    end

    def initialize(n)
      @n = n
    end

    def call
      clear_db
      pen = pen_repository.create(name: "Fake Pen")
      @n.times do |i|
        measurment_repository.create(pen_id: pen.id, spectrum: random_spectrum, sample: i + 1)
      end
    end

    private

    def clear_db
      pen_repository.clear
      measurment_repository.clear
    end

    def pen_repository
      PenRepository.new
    end

    def measurment_repository
      MeasurmentRepository.new
    end

    def random_spectrum
      Services::Helpers::MeasurmentTemplate
    end
  end
end
