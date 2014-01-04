describe Entity, '#game' do
  let(:instance) { described_class.new }
  subject { instance.game }

  it { should eq nil }

  it "is #stage's game" do
    instance.stage = Stage.new
    instance.game.should eq instance.stage.game
  end
end
