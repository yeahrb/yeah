describe Box, '#render' do
  let(:instance) { described_class.new }

  it "uses context to draw a rectangle with own color at position" do
    context = Unplatform::Context.new
    position = random_vector

    context.should_receive(:color).with(instance.color)
    context.should_receive(:rectangle).with(position, instance.size)

    instance.render(context, position)
  end
end
