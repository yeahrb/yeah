describe Game, '#context' do
  subject { described_class.new.context }

  it { should be_instance_of NullContext }
end
