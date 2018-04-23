class UserRepository < Hanami::Repository
  associations do
    has_many :measurments
    has_many :pens
    has_many :measurment_devices
  end

  def all
    users
      .order { name.asc }
      .to_a
  end

  def find_by_email(email)
    users
      .where(email: email)
      .one
  end

  def find_by_name(name)
    users
      .where(name: name)
      .one
  end
end
