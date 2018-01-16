module Web::Controllers::Pens
  class Create
    include Web::Action

    params do
      required(:pen).schema do
        required(:name).filled(size?: 2..100)
        required(:color).maybe(size?: 2..100)
        required(:comments).maybe(size?: 2..500)
      end
    end

    def call(params)
      if params.valid?
        PenRepository.new.create(params[:pen])
        redirect_to "/pens"
      else
        self.status = 422
      end
    end
  end
end
