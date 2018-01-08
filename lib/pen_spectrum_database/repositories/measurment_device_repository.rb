class MeasurmentDeviceRepository < Hanami::Repository
  associations do
    has_many :measurments
  end
end
