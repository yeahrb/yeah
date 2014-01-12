describe Color, '#inspect' do
  it "is a human-friendly representation of itself" do
    subject.rgba_bytes = [Random.rand(50), Random.rand(50), Random.rand(50)]
    subject.inspect.should eq "#{described_class.name}[#{subject.rgba_bytes.join(', ')}]"
  end
end
