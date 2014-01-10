describe Surface, '::new' do
  let(:vector) { random_vector }

  it { described_class.new.size.should eq V[] }

  it "accepts a Vector size" do
    surface = described_class.new(vector)
    surface.size.should eq vector
  end
end
