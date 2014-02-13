describe Entity, '#game' do
  let(:instance) { described_class.new }
  subject { instance.game }

  it { should eq nil }

  it "is #area's game" do
    instance.game.should eq instance.area.game
  end
end
