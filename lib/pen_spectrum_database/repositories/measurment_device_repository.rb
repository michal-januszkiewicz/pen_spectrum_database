class MeasurmentDeviceRepository < Hanami::Repository
  associations do
    has_many :measurments
  end

  def find_by_id(id:)
    measurment_devices
      .where(id: id)
      .one
  end
end
