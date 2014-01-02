describe Vector, '#reset' do
  it "sets components to 0" do
    subject.reset
    subject.components.should eq [0, 0, 0]
  end
end
