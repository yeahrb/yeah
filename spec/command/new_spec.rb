describe Command, '::new' do
  let(:project_name) { 'dang' }

  it "defers to Utility::make_project" do
    Utility.should receive(:make_project).with(project_name)

    subject.new(project_name)
  end
end
