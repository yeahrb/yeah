describe Thing, '#game' do
  it "is #space's game" do
    subject.space.game = Game.new

    subject.game.should eq subject.space.game
  end
end
