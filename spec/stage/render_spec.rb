describe Stage, '#render' do
  let(:instance) { described_class.new }
  subject { instance.render }

  it { should be_instance_of Surface }

  it "has a size that matches game resolution if it exists" do
    test_stage = Stage.new
    test_stage.game = Game.new
    test_stage.game.resolution = V.random(5, 5) + V[5, 5]
    test_stage.render.size.should eq test_stage.game.resolution
  end

  it "has a size that matches tile data otherwise" do
    test_stage = Class.new(Stage)
    test_stage.tile_size 16
    test_stage.tiles ["   ",
                    "   "]

    test_stage.new.render.size.should eq V[48, 32]

    test_stage.tiles ["  ",
                    "  ",
                    "  "]
    test_stage.new.render.size.should eq V[32, 48]
  end

  it "renders stage entities" do
    color = Color[0, 255, 0, 255]
    entity = Entity.new
    entity.visual = Rectangle.new(V[1, 1], color)
    entity.position = V[Random.rand(10), Random.rand(10)]
    instance.entities << entity
    instance.render.color_at(entity.position).should eq color
  end
end
