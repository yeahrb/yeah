describe Entity, '#top' do
  it { subject.top.should eq 0 }

  it "is y of top edge within stage" do
    subject.stage = Stage.new
    subject.position = V[10, 10]
    subject.size = V[4, 2]
    subject.top.should eq 12
  end
end
