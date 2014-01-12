describe Command, '::run' do
  it "loads project" do
    Utility.stub(:run_project)
    Utility.should receive(:load_project)

    subject.run
  end

  it "runs project" do
    Utility.stub(:load_project)
    Utility.should receive(:run_project)

    subject.run
  end
end
