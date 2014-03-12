describe Thing, '#right' do
  it { subject.right.should eq 0 }

  it "is x of right edge within level" do
    subject.level = Level.new
    subject.position = V[10, 10]
    subject.size = V[4, 2]
    subject.right.should eq 14
  end

  context "with level" do
    before do
      subject.level = Level.new
      subject.position = V[10, 10, 10]
      subject.size = V[4, 2, 8]
    end

    it "is x of right edge within level based on anchor" do
      subject.anchor[0] = 0
      subject.right.should eq 14

      subject.anchor[0] = 1
      subject.right.should eq 10

      subject.anchor[0] = 0.5
      subject.right.should eq 12
    end
  end
end
