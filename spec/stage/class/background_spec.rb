describe Stage, '::background' do
  subject { described_class.background }
  after(:each) { described_class.class_variable_set :@@background, nil }

  it { should eq Color[] }

  it "assigns itself" do
    background = :black
    described_class.background background
    described_class.background.should eq background
  end

  it "assigns #background in instances" do
    background = :black
    described_class.background(background)
    described_class.new.background.should eq background
  end
end
