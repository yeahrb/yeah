describe Game, '::new' do
  it "has NullContext context by default" do
    described_class.new.context.should be_instance_of NullContext
  end

  it "accepts context" do
    whatever_context = Object.new
    instance = described_class.new(whatever_context)

    instance.context.should eq whatever_context
  end
end
