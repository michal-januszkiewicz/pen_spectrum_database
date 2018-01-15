module Web::Views::Pens
  class New
    include Web::View

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
  end
end
