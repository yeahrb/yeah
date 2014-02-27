describe Game, '::new' do
  it "has NullContext context type by default" do
    described_class.new.context_type.should eq NullContext
  end

  it "accepts context type" do
    whatever_class = Class.new
    instance = described_class.new(whatever_class)

    instance.context_type.should eq whatever_class
  end
end
