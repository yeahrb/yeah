describe Thing do
  include_examples :has_accessor, :size do
    let(:default) { V[] }
    let(:assignables) { [V[8, 9, 9]] }
  end

  describe '#size' do
    let(:size) { random_vector }

    it "is implied by visual size" do
      subject.visual = Struct.new(:size).new(size) # todo: use null visual
      subject.size.should eq size
    end

    it "is not implied by visual size after size is explicitly set" do
      subject.size = size
      subject.visual = Struct.new(:size).new(size) # todo: use null visual
      subject.size.should eq size
    end
  end
end
