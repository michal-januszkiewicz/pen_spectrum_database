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

  def by_ids(ids:)
    aggregate(:pen, :measurment_device)
      .where(id: ids)
      .to_a
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

  def spectrums_by_type(type:)
    measurments
      .select(:id, :spectrum)
      .where(type: type)
      .to_a
  end

  # TODO: Refactor
  # rubocop:disable Security/Eval
  def all_with_pens_and_devices(pen_id: nil, device_id: nil)
    query = "aggregate(:pen, :measurment_device)"
    query << by_device(device_id)
    query << by_pen(pen_id)
    query << ".order { created_at.desc }"
    query << ".to_a"
    eval(query)
  end
  # rubocop:enable Security/Eval

  def by_device(device_id)
    return "" unless device_id
    ".where(measurment_device_id: device_id)"
  end

  def by_pen(pen_id)
    return "" unless pen_id
    ".where(pen_id: pen_id)"
  end

  def find_similar(id:, range: [0, 10_000]) # rubocop:disable Metrics/AbcSize
    main = find_by_id(id: id)
    measurments = spectrums_by_type(type: main.type)
    measurments.delete_if { |x| x.id == id }
    main_points = select_points_of_interest(main.spectrum, range)
    similarities_array = create_similarities_array(measurments, main_points, range)
    similarities_array.sort! { |p1, p2| p1[1] <=> p2[1] }
    ids = similarities_array[0..4].transpose[0]
    by_ids(ids: ids).sort_by { |x| ids.index x.id }
  end

  private

  def select_points_of_interest(spectrum, range)
    spectrum.select do |point|
      point[0].to_f > range[0].to_f && point[0].to_f < range[1].to_f
    end
  end

  def create_similarities_array(measurments, main_points, range)
    measurments.each_with_object([]) do |measurment, array|
      points_of_interest = select_points_of_interest(measurment.spectrum, range)
      standard_deviation = calculate_standard_deviation(points_of_interest, main_points)
      array.push([measurment.id, standard_deviation])
    end
  end

  def calculate_standard_deviation(points_of_interest, main_points)
    sum = 0
    points_of_interest.each_with_index do |point, index|
      sum += (point[1].to_i - main_points[index][1].to_i).abs
    end
    sum / main_points.size
  end
end
