describe DesktopWindow, '#render' do
  let(:instance) { described_class.new }

  it { expect { instance.render }.to raise_error ArgumentError }

  it "renders a stage" do
    # TODO
  end
end
