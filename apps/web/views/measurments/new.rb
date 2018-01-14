module Web::Views::Measurments
  class New
    include Web::View

    # rubocop:disable Metrics/AbcSize
    # rubocop:disable Metrics/MethodLength
    def measurment_form
      form_for :measurment, "/measurments" do
        div class: "input" do
          label      :name
          text_field :name
        end

        div class: "input" do
          label      :type
          text_field :type
        end

        div class: "input" do
          label       :comments
          text_field  :comments
        end

        div class: "input" do
          label       :pen
          select      :pen_id, pens
        end

        div class: "input" do
          label      :spectrum
          text_area  :spectrum
        end

        div class: "controls" do
          submit "Create measurment"
        end
      end
    end
    # rubocop:enable Metrics/AbcSize
    # rubocop:enable Metrics/MethodLength

    private

    def pens
      PenRepository.new.all.each_with_object({}) do |pen, hash|
        hash[pen.name] = pen.id
      end
    end
  end
end
