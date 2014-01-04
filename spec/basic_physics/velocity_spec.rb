describe BasicPhysics do
  let(:entity) do
    Entity.class_eval "include #{described_class.name}"
    Entity.new
  end

  describe '#velocity' do
    subject { entity.velocity }

    it { should eq V[0, 0, 0] }
  end

  describe '#velocity=' do
    subject { entity.method(:velocity=) }

    it_behaves_like 'writer', V[1, 2, 3]
  end
end
