describe Entity, '#right' do
  it { subject.right.should eq 0 }

  it "is x of right edge within stage" do
    subject.stage = Stage.new
    subject.position = V[10, 10]
    subject.size = V[4, 2]
    subject.right.should eq 14
  end

  context "with stage" do
    before do
      subject.stage = Stage.new
      subject.position = V[10, 10, 10]
      subject.size = V[4, 2, 8]
    end

    it "is x of right edge within stage based on anchor" do
      subject.anchor[0] = 0
      subject.right.should eq 14

      subject.anchor[0] = 1
      subject.right.should eq 10

      subject.anchor[0] = 0.5
      subject.right.should eq 12
    end
  end
end
