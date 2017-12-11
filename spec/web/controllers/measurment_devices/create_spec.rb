RSpec.describe Web::Controllers::MeasurmentDevices::Create, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end
