describe Thing do
  include_examples :has_accessor, :size do
    let(:default) { V[] }
    let(:assignables) { [V[8, 9, 9]] }
  end

  describe '#size' do
    let(:size) { random_vector }

    it "is implied by look size" do
      subject.look = Look.new
      subject.size.should eq subject.look.size
    end

    it "is not implied by look size after size is explicitly set" do
      subject.size = size
      subject.look = Look.new
      subject.size.should eq size
    end
  end
end
