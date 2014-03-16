describe Game, '#update' do
  before { subject.space = Space.new }

  it "calls #space's update" do
    subject.space.should receive(:update)
    subject.send(:update)
  end
end
