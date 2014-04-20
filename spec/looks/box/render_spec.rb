describe Box, '#render' do
  it "uses context to draw a rectangle with own color at position" do
    screen = subject.send(:screen)
    thing = subject.thing

    screen.should_receive(:color).with(subject.color)
    screen.should_receive(:rectangle).with(thing.position, thing.size)

    subject.render
  end
end
