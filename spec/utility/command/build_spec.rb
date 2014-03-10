describe Command, '::build' do
  let(:dir) { '/dev/null/' }

  it "loads a project" do
    project_stub = Struct.new(:build)
    Project.should receive(:load).with(dir).and_return(project_stub.new)
    described_class.build(dir)
  end

  it "builds a project" do
    # TODO
  end
end
