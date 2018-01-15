module Web::Controllers::Pens
  class Show
    include Web::Action

    expose :pen

    def call(params)
      @pen = PenRepository.new.find_by_id(id: params[:id])
    end
  end
end
