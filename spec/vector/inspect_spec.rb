describe Vector, '#inspect' do
  let(:components) { [1, 3, 5].shuffle }
  subject { described_class.new(components) }

  it "is a human-friendly representation of self" do
    subject.inspect.should eq "#{described_class.name}[#{subject.components.join(', ')}]"
  end
end
