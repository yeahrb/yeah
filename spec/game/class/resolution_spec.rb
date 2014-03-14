describe Game, '::resolution' do
  let(:resolution) { V[320, 240] }
  let(:mock_context) { Struct.new(:resolution).new(V[1280, 720]) }
  let(:game_subclass) { Class.new(Game) }
  let(:game) { game_subclass.new(mock_context) }

  it "sets Vector as instance resolution" do
    game_subclass.resolution(resolution)

    expect(game.context.resolution).to eq resolution
  end

  it "sets splatted array as instance resolution" do
    game_subclass.resolution(*resolution.to_a)

    expect(game.context.resolution).to eq resolution
  end
end
