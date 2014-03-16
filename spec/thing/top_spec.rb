describe Thing, '#top' do
  it { subject.top.should eq 0 }

  context "with space" do
    before do
      subject.space = Space.new
      subject.position = V[10, 10, 10]
      subject.size = V[4, 2, 8]
    end

    it "is y of top edge within space based on anchor" do
      subject.anchor[1] = 0
      subject.top.should eq 12

      subject.anchor[1] = 1
      subject.top.should eq 10

      subject.anchor[1] = 0.5
      subject.top.should eq 11
    end
  end
end
