describe Utility, '::make_project' do
  let(:name) { "yo_sho_ya_am_sho" }

  it "creates project file structure" do
    Dir.should receive(:mkdir).with("#{name}/")

    %i[entities visuals maps assets config].each do |subdir|
      Dir.should receive(:mkdir).with("#{name}/#{subdir}/")
    end

    File.should receive(:open).with("#{name}/game.rb", 'w')
    # TODO: Test contents of game.rb.

    described_class.make_project(name)
  end
end
