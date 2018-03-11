module Web::Views::Pens
  module FormHelper
    def pen_form
      form_layout(routes.pens_path, "Create", :post)
    end

    def edit_pen_form(id)
      values = { pen: fetch_pen(id) }
      form_layout(routes.pen_path(id), "Update", :patch, values: values)
    end

    def destroy_pen_form(id)
      form_for :pens, routes.pen_path(id), method: :delete do
        div class: "controls" do
          submit "Delete", class: "btn btn-danger"
        end
      end
    end

    private

    # rubocop:disable Metrics/MethodLength
    # rubocop:disable Metrics/AbcSize
    def form_layout(path, action, method, values: {})
      form_for :pen, path, method: method, values: values do
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

        div class: "group-controls" do
          div class: "form-group" do
            submit action, class: "btn-success btn"
          end

          div class: "form-group cancel" do
            link_to "Cancel", routes.pens_path, class: "btn-danger btn"
          end
        end
      end
    end
    # rubocop:enable Metrics/AbcSize
    # rubocop:enable Metrics/MethodLength

    def fetch_pen(id)
      PenRepository.new.find_by_id(id: id)
    end
  end
end
