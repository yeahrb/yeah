describe Game, '#update' do
  before { subject.level = Level.new }

  it "calls #level's update" do
    subject.level.should receive(:update)
    subject.send(:update)
  end
end
