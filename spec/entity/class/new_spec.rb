describe Entity, '::new' do
  it { described_class.new.should be_instance_of described_class }
  it { described_class.new.position.should eq V[0, 0, 0] }
  it { described_class.new(V[2, 4, 8]).position.should eq V[2, 4, 8] }
end
