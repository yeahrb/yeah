describe Thing, '#update' do
  subject { described_class.new.method(:update) }

  its(:call) { should eq nil }
end
