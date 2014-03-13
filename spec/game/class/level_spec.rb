describe Game, '::level' do
  let(:level_a) do {} end
  let(:level_b) do { background: [0.2, 0.2, 0.2] } end
  let(:data) do { levels: { level_a: level_a, level_b: level_b } } end

  it "sets first level" do
    game_subclass = Class.new(Game)
    game_subclass.level(:level_b)
    game = game_subclass.new(NullContext.new, data)

    expect(game.level.background).to eq level_b[:background]
  end
end
