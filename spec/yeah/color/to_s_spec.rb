describe Color, '#to_s' do
  it "is a human-friendly representation of itself" do
    class_name = described_class.name
    rgba = subject.rgba.join(', ')

    expect(subject.to_s).to eq "#{class_name}[#{rgba}]"
  end
end
