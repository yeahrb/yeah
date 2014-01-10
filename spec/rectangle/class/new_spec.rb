describe Rectangle, '::new' do
  it { described_class.new.should be_instance_of described_class }
  it { described_class.new.size.should eq V[] }
  it { described_class.new.color.should eq Color[255, 255, 255, 255] }

  it "assigns V first argument as #size" do
    vector = random_vector
    described_class.new(vector).size.should eq vector
  end

  it "assigns Color second argument as #color" do
    byte_array = (1..4).map { Random.rand(255) }
    color = Color[*byte_array]
    described_class.new(V[], color).color.should eq color
  end
end
