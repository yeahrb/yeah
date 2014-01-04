describe Stage do
  describe '#background' do
    subject { described_class.new.background }
    after(:each) { described_class.class_variable_set :@@background, nil }

    it "is @@background" do
      described_class.background :orange
      described_class.new.background.should eq :orange
    end
  end

  describe '#background=' do
    subject { described_class.new.method(:background=) }

    it_behaves_like 'writer', Color[*[Random.rand(255)]*4]
  end
end
