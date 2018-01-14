module Web::Views::Pens
  class Edit
    include Web::View

    # rubocop:disable Metrics/MethodLength
    def edit_pen_form(id)
      form_for :pen, routes.pen_path(id), method: :patch, values: { pen: pen(id) } do
        div class: "input" do
          label      :name
          text_field :name
        end

        div class: "input" do
          label      :color
          text_field :color
        end

        div class: "input" do
          label      :comments
          text_area :comments
        end

        div class: "controls" do
          submit "Update"
        end
      end
    end
    # rubocop:enable Metrics/MethodLength

    private

    def pen(id)
      PenRepository.new.find_by_id(id: id)
    end
  end
end
