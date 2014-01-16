describe Utility, '::project_structure' do
  subject { described_class.project_structure('peppe_roni') }

  it "generates a hash representing a project's file structure" do
    game_rb = "require \"yeah\"\n"
    game_rb += "include Yeah\n\n"
    game_rb += "class PeppeRoniGame < Game\n"
    game_rb += "end"

    structure = {
      peppe_roni: {
        entities: {},
        visuals: {},
        maps: {},
        assets: {},
        config: {},
        'game.rb' => game_rb
      }
    }

    subject.should eq(structure)
  end
end
