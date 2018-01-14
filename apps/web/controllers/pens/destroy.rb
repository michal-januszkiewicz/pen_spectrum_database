module Web::Controllers::Pens
  class Destroy
    include Web::Action

    params do
      required(:id).filled
    end

    def call(params)
      PenRepository.new.delete(params[:id]) if params.valid?
      redirect_to "/pens"
    end
  end
end
