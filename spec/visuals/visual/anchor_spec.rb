describe Visual do
  include_examples :has_accessor, :anchor do
    let(:default) { V[] }
    let(:assignables) { [V[3, 5, 9]] }
  end

  describe '#anchor' do
    it "defaults to class anchor if it is defined" do
      subclass = Class.new(Visual)
      subclass.anchor = random_vector
      instance = subclass.new

      instance.anchor.should eq subclass.anchor
    end
  end
end
