describe Stage, '::tiles' do
  subject { described_class.tiles }
  after(:each) { described_class.class_variable_set :@@tiles, nil }

  it { should eq [] }

  it "assigns itself" do
    tiles = ["###"]
    described_class.tiles tiles
    described_class.tiles.should eq tiles
  end
end
