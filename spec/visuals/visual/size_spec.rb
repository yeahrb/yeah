describe Visual do
  include_examples :has_accessor, :size do
    let(:default) { V[] }
    let(:assignables) { [V[9, 5, 3]] }
  end

  describe '#size' do
    it "defaults to class size if it is defined" do
      subclass = Class.new(Visual)
      subclass.size = random_vector
      instance = subclass.new

      instance.size.should eq subclass.size
    end
  end
end
