describe Thing, '#left' do
  it { subject.left.should eq 0 }

  context "with space" do
    before do
      subject.space = Space.new
      subject.position = V[10, 10, 10]
      subject.size = V[4, 2, 8]
    end

    it "is x of left edge within space based on anchor" do
      subject.anchor[0] = 0
      subject.left.should eq 10

      subject.anchor[0] = 1
      subject.left.should eq 14

      subject.anchor[0] = 0.5
      subject.left.should eq 12
    end
  end
end
