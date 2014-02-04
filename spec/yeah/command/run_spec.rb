describe Command, '::run' do
  let(:dir) { '/dev/null/' }

  it "runs a project" do
    Project.should receive(:run).with(dir)
    subject.run(dir)
  end
end
