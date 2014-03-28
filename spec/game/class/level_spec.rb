describe Game, '::space' do
  let(:space_a) do {} end
  let(:space_b) do { background: [0.2, 0.2, 0.2] } end
  let(:data) do { spaces: { space_a: space_a, space_b: space_b } } end

  it "sets first space" do
    game_subclass = Class.new(Game)
    game_subclass.space(:space_b)
    game = game_subclass.new(Unplatform::Context.new, data)

    expect(game.space.background).to eq space_b[:background]
  end
end
