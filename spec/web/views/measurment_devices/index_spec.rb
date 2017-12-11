RSpec.describe Web::Views::MeasurmentDevices::Index, type: :view do
  let(:exposures) { Hash[foo: "bar"] }
  let(:template)  do
    Hanami::View::Template.new("apps/web/templates/measurment_devices/index.html.slim")
  end
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    pending "This is an auto-generated test. Edit it and add your own tests."

    # Example
    expect(view.foo).to eq exposures.fetch(:foo)
  end
end
