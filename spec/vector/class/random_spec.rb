describe Vector, '::random' do
  it "is a Vector with components between 0 and nth arg" do
    max = 10
    rand_vec = described_class.random(max, max, max)
    rand_vec.components.each do |c|
      (c > max).should_not be_true
      (c < 0).should_not be_true
    end
  end
end
