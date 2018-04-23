class PenRepository < Hanami::Repository
  associations do
    has_many :measurments
  end

  def all
    pens
      .order { created_at.desc }
      .to_a
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
