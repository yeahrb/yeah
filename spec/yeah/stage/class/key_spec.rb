describe Stage, '::key' do
  subject { described_class.key }
  after(:each) { described_class.class_variable_set :@@key, nil }

  it { should eq Hash.new }

  it "assigns itself" do
    key = { '#' => Entity }
    described_class.key key
    described_class.key.should eq key
  end
end
