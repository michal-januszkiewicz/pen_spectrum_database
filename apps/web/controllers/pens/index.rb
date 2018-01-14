module Web::Controllers::Pens
  class Index
    include Web::Action

    expose :pens

    def call(_params)
      @pens = PenRepository.new.all
    end
  end
end
