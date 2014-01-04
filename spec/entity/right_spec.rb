describe Entity, '#right' do
  it { subject.right.should eq 0 }

  it "is x of right edge within stage" do
    subject.stage = Stage.new
    subject.position = V[10, 10]
    subject.size = V[4, 2]
    subject.right.should eq 14
  end
end
