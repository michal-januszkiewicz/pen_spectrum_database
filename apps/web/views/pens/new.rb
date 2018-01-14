module Web::Views::Pens
  class New
    include Web::View

    # rubocop:disable Metrics/MethodLength
    def pen_form
      form_for :pen, "/pens" do
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
          submit "Create pen"
        end
      end
    end
    # rubocop:enable Metrics/MethodLength
  end
end
