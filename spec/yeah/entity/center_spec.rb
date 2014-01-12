describe Entity, '#center' do
  it { subject.center.should eq V[] }

  it "is position of center within stage" do
    subject.stage = Stage.new
    subject.position = V[10, 10]
    subject.size = V[4, 2]
    subject.center.should eq V[12, 11]
  end
end
