module Web::Views::Measurments
  class Edit
    include Web::View
    include FormHelper

    private

    def measurment(id)
      MeasurmentRepository.new.find_by_id(id: id)
    end
  end
end
