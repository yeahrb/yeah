describe Command, '::run' do
  let(:dir) { '/dev/null/' }

  it "loads a project" do
    project_stub = Struct.new(:run)
    Project.should receive(:load).with(dir).and_return(project_stub.new)
    described_class.run(dir)
  end

  it "runs a project" do
    # TODO
  end
end
