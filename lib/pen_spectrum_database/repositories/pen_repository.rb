class PenRepository < Hanami::Repository
  associations do
    has_many :measurments
  end

  def find_by_id(id:)
    pens
      .where(id: id)
      .one
  end

  def find_by_name(name)
    pens
      .where(name: name)
      .one
  end
end
