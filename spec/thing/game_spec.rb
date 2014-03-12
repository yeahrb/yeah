describe Thing, '#game' do
  let(:instance) { described_class.new }
  subject { instance.game }

  it { should eq nil }

  it "is #level's game" do
    instance.game.should eq instance.level.game
  end
end
