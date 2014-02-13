describe Game, '#update' do
  before { subject.area = Area.new }

  it "calls #area's update" do
    subject.area.should receive(:update)
    subject.send(:update)
  end
end
