describe Game do
  describe '#space' do
    its(:space) { should be_instance_of Space }

    it "defaults to data space by key of class space if it is defined" do
      subclass = Class.new(described_class)

      subclass.new.space.background.should eq Color[]

      background = [0.1, 0.2, 0.9]
      data = { spaces: { some_space: { background: background } } }
      subclass.space = :some_space
      subject = subclass.new(data)

      subject.space.background.should eq background
    end
  end

  describe '#space=' do
    include_examples :writer, :space=, Space.new

    it "sets space's game as self" do
      subject.space = Space.new

      expect(subject.space.game).to eq subject

      subject.space = subject.space
    end

    it "does not set space's game as self twice" do
      subject.space = Space.new

      expect(subject.space).to_not receive(:game=)

      subject.space = subject.space
    end

    it "accepts space data key" do
      background = [0.5, 0.25, 0.125]
      subject.data = {
        spaces: {
          some_space: {
            background: background
          }
        }
      }
      subject.space = :some_space

      expect(subject.space.background).to eq background
    end
  end
end
