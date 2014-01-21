describe Command, '::new' do
  let(:project_name) { 'dang' }

  it "generates a project" do
    Project.should receive(:generate).with(project_name)
    subject.new(project_name)
  end
end
