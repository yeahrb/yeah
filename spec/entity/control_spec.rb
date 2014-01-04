describe Entity, '#control' do
  # TODO: make this unnecessary
  before do
    subject.stage = Stage.new
    subject.stage.game = Game.new
    DesktopWindow.class_eval "def each_tick; yield; end"
    subject.game.start
  end

  describe "one pressable" do
    it "adds to attribute if pressed" do
      subject.game.context.press :q
      subject.control 'position.y', :q, 2
      subject.position.y.should eq 2
    end

    it "subtracts from attribute if not pressed" do
      subject.control 'position.y', :q, 2
      subject.position.y.should eq -2
    end
  end

  describe "two pressables" do
    it "does nothing by default" do
      subject.control 'position.y', [:q, :e], 2
      subject.position.y.should eq 0
    end

    it "adds to attribute if first is pressed" do
      subject.game.context.press :q
      subject.control 'position.y', [:q, :e], 2
      subject.position.y.should eq 2
    end

    it "subtracts from attribute if second is pressed" do
      subject.game.context.press :e
      subject.control 'position.y', [:q, :e], 2
      subject.position.y.should eq -2
    end
  end
end
