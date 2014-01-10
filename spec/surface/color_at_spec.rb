describe Surface, '#color_at' do
  let(:vector) { random_vector }
  subject { described_class.new(vector) }

  it { expect {subject.color_at}.to raise_error ArgumentError }

  it "matches the color of the pixel at position" do
    subject.color_at(vector/2).should eq Color[0, 0, 0, 0]
  end
end
