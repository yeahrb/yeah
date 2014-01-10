describe Surface do
  let(:vector) { random_vector }
  subject { described_class.new(vector) }

  describe '#data' do
    it "has length of #size.x * #size.y * 4" do
      subject.size = subject.size * 2
      expected_length = subject.size.x * subject.size.y * 4
      subject.data.length.should eq expected_length
    end

    it 'is a series of \x00\x00\x00\x00 by default' do
      pixels = subject.data.unpack('H*')[0].scan(/.{8}/)
      pixels.uniq.size.should eq 1
      pixels.uniq.last.should eq "00000000"
    end
  end

  describe '#data=' do
    it "assigns hex data of length size.x * size.y * 4" do
      data = "\xFF" * subject.size.x * subject.size.y * 4
      subject.data = data
      subject.data.should eq data
    end
  end
end
