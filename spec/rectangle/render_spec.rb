describe Rectangle, '#render' do
  it { subject.render.should be_instance_of Surface }

  it "matches size" do
    subject.size = random_vector
    subject.render.size.should eq subject.size
  end

  it "matches color" do
    subject.size = V[10, 10]
    subject.color = Color[*[Random.rand(255)]*4]
    render = subject.render
    render.color_at(V[]).should eq subject.color
    render.color_at(subject.size/2).should eq subject.color
    render.color_at(subject.size-V[1, 1]).should eq subject.color
  end
end
