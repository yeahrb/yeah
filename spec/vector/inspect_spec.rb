describe Vector, '#inspect' do
  let(:components) { [1, 3, 5].shuffle }
  subject { described_class.new(components) }

  it "is a human-friendly representation of self" do
    represent = "#{described_class.name}[#{subject.components.join(', ')}]"
    expect(subject.inspect).to eq represent
  end
end
