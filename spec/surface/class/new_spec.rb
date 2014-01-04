describe Surface, '::new' do
  let(:vector) { V.random(48, 48) + V[2, 2] }

  it { described_class.new.size.should eq V[] }

  it "accepts a Vector size" do
    surface = described_class.new(vector)
    surface.size.should eq vector
  end
end
