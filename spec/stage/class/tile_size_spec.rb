describe Stage, '::tile_size' do
  subject { described_class.tile_size }
  after(:each) { described_class.class_variable_set :@@tile_size, nil }

  it { should eq 0 }

  it "assigns itself" do
    tile_size = V[5, 5]
    described_class.tile_size tile_size
    described_class.tile_size.should eq tile_size
  end
end
