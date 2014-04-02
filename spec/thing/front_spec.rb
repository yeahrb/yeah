describe Thing, '#front' do
  it { subject.front.should eq 0 }

  context "with space" do
    before do
      subject.space = Space.new
      subject.position = V[10, 10, 10]
      subject.size = V[4, 2, 8]
    end

    it "is z of front edge within space based on anchor" do
      subject.anchor.z = 0
      subject.front.should eq 18

      subject.anchor.z = 1
      subject.front.should eq 10

      subject.anchor.z = 0.5
      subject.front.should eq 14
    end
  end
end
