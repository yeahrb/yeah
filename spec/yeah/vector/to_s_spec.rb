describe Vector, '#to_s' do
  let(:components) { [1, 3, 5].shuffle }
  subject { described_class.new(components) }

  it "is a human-friendly representation" do
    represent = "#{described_class.name}[#{subject.components.join(', ')}]"
    expect(subject.to_s).to eq represent
  end
end
