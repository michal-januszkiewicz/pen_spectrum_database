module Web::Views::Pens
  class Edit
    include Web::View

    # rubocop:disable Metrics/MethodLength
    def edit_pen_form(id)
      form_for :pen, routes.pen_path(id), method: :patch, values: { pen: pen(id) } do
        div class: "form-group" do
          label      :name
          text_field :name, class: "form-control"
        end

        div class: "form-group" do
          label      :color
          text_field :color, class: "form-control"
        end

        div class: "form-group" do
          label      :comments
          text_area :comments, class: "form-control"
        end

        div class: "controls" do
          submit "Update", class: "btn-success btn-primary btn"
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
