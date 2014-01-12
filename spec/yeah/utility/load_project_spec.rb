describe Utility, '::load_project' do
  it "recursively requires every Ruby file in current dir" do
    described_class.should receive(:require_recursively).with('.')
    described_class.load_project
  end
end
