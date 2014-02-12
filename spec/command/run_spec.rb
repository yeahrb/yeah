describe Command, '::run' do
  let(:dir) { '/dev/null/' }

  it "loads a project" do
    Project.should receive(:load).with(dir)
    described_class.run(dir)
  end

  it "runs a project" do
    # TODO
  end
end
