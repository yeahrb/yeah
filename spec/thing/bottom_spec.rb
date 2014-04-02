describe Thing, '#bottom' do
  it { subject.bottom.should eq 0 }

  context "with space" do
    before do
      subject.space = Space.new
      subject.position = V[10, 10, 10]
      subject.size = V[4, 2, 8]
    end

    it "is y of bottom edge within space based on anchor" do
      subject.anchor.y = 0
      subject.bottom.should eq 10

      subject.anchor.y = 1
      subject.bottom.should eq 12

      subject.anchor.y = 0.5
      subject.bottom.should eq 11
    end
  end
end
