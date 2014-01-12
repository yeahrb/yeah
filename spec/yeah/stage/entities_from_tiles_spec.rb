describe Stage, '#entities_from_tiles' do
  subject { described_class.new.send(:entities_from_tiles) }

  it { should eq [] }

  # TODO eep
  it "generates entities based on tile class variables" do
    test_stage = Class.new(Stage)
    test_entity_a = Class.new(Entity)
    test_entity_b = Class.new(Entity)
    test_stage.key({ 'a' => test_entity_a, 'b' => test_entity_b })
    test_stage.tile_size 16
    test_stage.tiles ['aa b',
                    ' ba ']

    eft = test_stage.new.entities_from_tiles
    eft.count.should eq 5
    eft.reject { |e| e.is_a? test_entity_a }.count.should eq 2
    eft.reject { |e| e.is_a? test_entity_b }.count.should eq 3
    b_positions = eft.reject { |e| e.is_a? test_entity_a }.map(&:position)
    b_positions.should eq [V[16, 0], V[48, 16]]
  end
end
