describe Vector do
  let(:arguments) { [1, 3, 5].shuffle }
  subject { described_class.new(arguments) }

  describe '#[]' do
    it { subject[0].should eq arguments[0] }
    it { subject[1].should eq arguments[1] }
    it { subject[2].should eq arguments[2] }
  end

  describe '#[]=' do
    it "assigns n component" do
      3.times do |i|
        old_val = subject[i]
        subject[i] = subject[i] + 5
        subject[i].should eq arguments[i] + 5
      end
    end
  end
end
