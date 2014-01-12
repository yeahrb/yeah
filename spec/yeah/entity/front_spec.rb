describe Entity, '#front' do
  it { subject.front.should eq 0 }

  it "is z of front edge within stage" do
    subject.stage = Stage.new
    subject.position = V[10, 10, 10]
    subject.size = V[4, 2, 8]
    subject.front.should eq 18
  end
end
