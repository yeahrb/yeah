describe Thing, '#front' do
  it { subject.front.should eq 0 }

  context "with level" do
    before do
      subject.level = Level.new
      subject.position = V[10, 10, 10]
      subject.size = V[4, 2, 8]
    end

    it "is z of front edge within level based on anchor" do
      subject.anchor[2] = 0
      subject.front.should eq 18

      subject.anchor[2] = 1
      subject.front.should eq 10

      subject.anchor[2] = 0.5
      subject.front.should eq 14
    end
  end
end
