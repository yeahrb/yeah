describe Entity, '#bottom' do
  it { subject.bottom.should eq 0 }

  it "is y of bottom edge within stage" do
    subject.stage = Stage.new
    subject.position = V[10, 10]
    subject.size = V[4, 2]
    subject.bottom.should eq 10
  end
end
