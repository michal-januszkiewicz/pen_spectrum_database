class MeasurmentRepository < Hanami::Repository
  associations do
    belongs_to :pen
    belongs_to :measurment_device
  end

  def find_by_type_for_pen(type:, pen_id:)
    measurments
      .where(type: type, pen_id: pen_id)
      .one
  end

  def all_with_pens
    aggregate(:pen).to_a
  end
end
