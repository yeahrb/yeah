describe Entity, '#left' do
  it { subject.left.should eq 0 }

  it "is x of left edge within stage" do
    subject.stage = Stage.new
    subject.position = V[10, 10]
    subject.size = V[4, 2]
    subject.left.should eq 10
  end
end
