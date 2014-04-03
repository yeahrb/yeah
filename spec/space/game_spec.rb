describe Space do
  include_examples :has_accessor, :game do
    let(:default_type) { Game }
    let(:assignables) { [Game.new] }
  end

  describe '#game=' do
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
