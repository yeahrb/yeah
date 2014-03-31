describe Game, '::new' do
  it "accepts data" do
    data = { they_call_me: "Jack" }
    instance = described_class.new(data)

    instance.data.should eq data
  end

  it "accepts context" do
    whatever_context = Unplatform::Context.new
    instance = described_class.new({}, whatever_context)

    instance.context.should eq whatever_context
  end
end
