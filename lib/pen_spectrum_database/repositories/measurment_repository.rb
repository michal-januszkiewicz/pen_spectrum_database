class MeasurmentRepository < Hanami::Repository
  associations do
    belongs_to :pen
    belongs_to :measurment_device
  end

  def find_by_id(id:)
    measurments
      .where(id: id)
      .one
  end

  def find_by_type_for_pen(type:, pen_id:)
    measurments
      .where(type: type, pen_id: pen_id)
      .one
  end

  def one_with_pen_and_device(id:)
    aggregate(:pen, :measurment_device)
      .where(id: id)
      .one
  end

  # rubocop:disable Security/Eval
  def all_with_pens_and_devices(pen_id: nil, device_id: nil)
    query = "aggregate(:pen, :measurment_device)"
    query << by_device(device_id)
    query << by_pen(pen_id)
    query << ".to_a"
    eval(query)
  end
  # rubocop:enable Security/Eval

  def query_builder
    query = ""
    query
  end

  def by_device(device_id)
    return "" unless device_id
    ".where(measurment_device_id: device_id)"
  end

  def by_pen(pen_id)
    return "" unless pen_id
    ".where(pen_id: pen_id)"
  end
end
