describe Space do
  describe '#game' do
    its(:game) { should be_instance_of Game }
  end

  describe '#game=' do
    include_examples :writer, :game=, Game.new

    it "sets #game's space as self" do
      subject.game = Game.new
      subject.game.space.should eq subject
    end

    it "does not set game's space as self twice" do
      subject.game = Game.new
      subject.game.should_not receive(:space=)

      subject.game = subject.game
    end
  end
end
