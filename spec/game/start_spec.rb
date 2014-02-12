describe Game, '#start' do
  it "sets context" do
    subject.start
    subject.context.should be_instance_of NullContext
  end

  it "calls #context.each_tick with a block with #update and #render calls" do
    subject.should receive(:update)
    subject.should receive(:render)
    subject.start
  end
end
