describe Game, '::new' do
  it "accepts context" do
    whatever_context = NullPlatform::Context.new
    instance = described_class.new(whatever_context)

    instance.context.should eq whatever_context
  end

  it "accepts data" do
    context = NullPlatform::Context.new
    data = { they_call_me: "Jack" }
    instance = described_class.new(context, data)

    instance.data.should eq data
  end
end
