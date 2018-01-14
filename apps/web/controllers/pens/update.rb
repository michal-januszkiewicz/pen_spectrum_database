module Web::Controllers::Pens
  class Update
    include Web::Action

    params do
      required(:id).filled(:str?)
      required(:pen).schema do
        required(:name).filled(size?: 2..100)
        required(:color).maybe(size?: 2..100)
        required(:comments).maybe(size?: 2..500)
      end
    end

    def call(params)
      PenRepository.new.update(params[:id], params[:pen])
      redirect_to "/pens"
    end
  end
end
