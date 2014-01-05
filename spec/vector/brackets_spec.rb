describe Vector do
  let(:arguments) { [1, 3, 5].shuffle }
  subject { described_class.new(arguments) }

  describe '#[]' do
    3.times do |n|
      it { expect(subject[n]).to eq arguments[n] }
    end
  end

  describe '#[]=' do
    it "assigns n component" do
      3.times do |i|
        old_val = subject[i]
        subject[i] = subject[i] + 5
        expect(subject[i]).to eq arguments[i] + 5
      end
    end
  end
end
