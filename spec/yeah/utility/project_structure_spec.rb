describe Utility, '::project_structure' do
  subject { described_class.project_structure('peppe_roni') }

  it "generates a hash representing a project's file structure" do
    subject.should eq({
      peppe_roni: {
        entities: {},
        visuals: {},
        maps: {},
        assets: {},
        config: {},
        'game.rb' => <<-eoc.unindent
          require "yeah"
          include Yeah

          class PeppeRoniGame < Game
          end
        eoc
      }
    })
  end
end
