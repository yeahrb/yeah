describe Look do
  describe '#anchor' do
    its(:anchor) { should eq V[] }

    it "defaults to class anchor if it is defined" do
      subclass = Class.new(Look)
      subclass.anchor = random_vector
      instance = subclass.new

      instance.anchor.should eq subclass.anchor
    end
  end

  describe '#anchor=' do
    include_examples :writer, :anchor=
  end
end
