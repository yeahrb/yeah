describe Game, '#update' do
  before { subject.stage = Stage.new }

  it "calls #stage's update" do
    subject.stage.should receive(:update)
    subject.send(:update)
  end
end
