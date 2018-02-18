module Web::Views::Measurments
  class FindSimilar
    include Web::View

    def render
      raw JSON.generate(similar.map { |m| Representer.new(m).base })
    end
  end
end
