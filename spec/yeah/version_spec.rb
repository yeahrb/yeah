describe Yeah, '::VERSION' do
  subject { described_class::VERSION }

  it { should be_instance_of String }
  it { should match /[0-9]+\.[0-9]+\.[0-9]+/ }
end
