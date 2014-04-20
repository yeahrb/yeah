describe Vector do
  describe '#components' do
    its(:components) { should eq [0, 0, 0] }
  end

  describe '#components=' do
    include_examples :writer, :components=, [3, 6, 9]

    it "assigns array with up to 3 numbers" do
      subject.components = [4, 5, 6]
      expect(subject.components).to eq [4, 5, 6]

      subject.components = [8, 9]
      expect(subject.components).to eq [8, 9, 0]

      subject.components = []
      expect(subject.components).to eq [0, 0, 0]
    end

    it "assigns up to 3 numeric arguments" do
      subject.components = 6, 5, 4
      expect(subject.components).to eq [6, 5, 4]

      subject.components = 8
      expect(subject.components).to eq [8, 0, 0]
    end

    it "complains when given a 4-element array" do
      assign_four = lambda { subject.components = [7, 8, 9, 10] }
      expect(assign_four).to raise_error ArgumentError, /too many elements/
    end
  end
end
