describe Entity, '#back' do
  it { subject.back.should eq 0 }

  context "with stage" do
    before do
      subject.stage = Stage.new
      subject.position = V[10, 10, 10]
      subject.size = V[4, 2, 8]
    end

    it "is z of back edge within stage based on anchor" do
      subject.anchor[2] = 0
      subject.back.should eq 10

      subject.anchor[2] = 1
      subject.back.should eq 18

      subject.anchor[2] = 0.5
      subject.back.should eq 14
    end
  end
end
