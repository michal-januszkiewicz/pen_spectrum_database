module Web::Views::Pens
  module FormHelper
    # rubocop:disable Metrics/MethodLength
    def pen_form
      form_for :pen, "/pens" do
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
          submit "Create pen", class: "btn-success btn-primary btn"
        end
      end
    end
    # rubocop:enable Metrics/MethodLength

    # rubocop:disable Metrics/MethodLength
    def edit_pen_form(id)
      form_for :pen, routes.pen_path(id), method: :patch, values: { pen: fetch_pen(id) } do
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
          submit "Update", class: "btn-success btn"
        end
      end
    end
    # rubocop:enable Metrics/MethodLength

    def destroy_pen_form(id)
      form_for :pens, routes.pen_path(id), method: :delete do
        div class: "controls" do
          submit "Delete", class: "btn btn-danger"
        end
      end
    end

    private

    def fetch_pen(id)
      PenRepository.new.find_by_id(id: id)
    end
  end
end
