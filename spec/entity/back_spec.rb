describe Entity, '#back' do
  it { subject.back.should eq 0 }

  it "is z of back edge within stage" do
    subject.stage = Stage.new
    subject.position = V[10, 10, 10]
    subject.size = V[4, 2, 8]
    subject.back.should eq 10
  end
end
