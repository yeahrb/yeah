describe Look do
  describe '#size' do
    its(:size) { should eq V[] }

    it "defaults to class size if it is defined" do
      subclass = Class.new(Look)
      subclass.size = random_vector
      instance = subclass.new

      instance.size.should eq subclass.size
    end
  end

  describe '#size=' do
    include_examples :writer, :size=
  end
end
