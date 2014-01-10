describe Surface, '#fill' do
  let(:vector) { random_vector }
  let(:color) { Color[0, 255, 0, 255] }
  subject { described_class.new(vector) }

  it { expect {subject.fill}.to raise_error ArgumentError }

  it "changes color of rectangular area with position args" do
    subject.fill(color, V[], vector/2)
    subject.color_at(V[]).should eq color
    subject.color_at(vector/2).should eq color
    subject.color_at(vector/2 + V[1, 0]).should eq Color[0, 0, 0, 0]
    subject.color_at(vector/2 + V[0, 1]).should eq Color[0, 0, 0, 0]
    subject.data.length.should eq subject.size.x * subject.size.y * 4
  end

  it "changes color of entire surface without position args" do
    subject.fill(color)
    subject.color_at(V[]).should eq color
    subject.color_at(vector/2).should eq color
    subject.color_at(vector-1).should eq color
    subject.data.length.should eq subject.size.x * subject.size.y * 4
  end
end
