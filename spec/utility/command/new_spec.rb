describe Command, '::new' do
  let(:project_name) { 'dang' }
  let(:dir) { '/dev/null/' }

  it "generates a project" do
    Project.should receive(:generate).with(project_name, dir)
    subject.new(project_name, dir)
  end
end
