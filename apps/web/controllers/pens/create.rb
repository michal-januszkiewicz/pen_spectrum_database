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
      PenRepository.new.create(params[:pen]) if params.valid?
      redirect_to "/pens"
    end
  end
end
