require 'spec_helper'

describe Map do
  let(:klass) { described_class }
  let(:instance) { klass.new }

  it { klass.should be_instance_of Class }

  describe '::background' do
    subject { klass.background }
    after(:each) { klass.class_variable_set :@@background, nil }

    it { should eq Color[] }

    it "assigns itself" do
      background = :black
      klass.background background
      klass.background.should eq background
    end

    it "assigns #background in instances" do
      background = :black
      klass.background(background)
      klass.new.background.should eq background
    end
  end

  describe '::key' do
    subject { klass.key }
    after(:each) { klass.class_variable_set :@@key, nil }

    it { should eq Hash.new }

    it "assigns itself" do
      key = { '#' => Entity }
      klass.key key
      klass.key.should eq key
    end
  end

  describe '::tile_size' do
    subject { klass.tile_size }
    after(:each) { klass.class_variable_set :@@tile_size, nil }

    it { should eq 0 }

    it "assigns itself" do
      tile_size = V[5, 5]
      klass.tile_size tile_size
      klass.tile_size.should eq tile_size
    end
  end

  describe '::tiles' do
    subject { klass.tiles }
    after(:each) { klass.class_variable_set :@@tiles, nil }

    it { should eq [] }

    it "assigns itself" do
      tiles = ["###"]
      klass.tiles tiles
      klass.tiles.should eq tiles
    end
  end

  describe '#background' do
    subject { instance.background }
    after(:each) { klass.class_variable_set :@@background, nil }

    it "is @@background" do
      klass.background :orange
      klass.new.background.should eq :orange
    end
  end

  describe '#background=' do
    subject { instance.method(:background=) }
    it_behaves_like 'writer', Color[*[Random.rand(255)]*4]
  end

  describe '#entities' do
    subject { instance.entities }
    it { should eq [] }
  end

  describe '#entities=' do
    subject { instance.method(:entities=) }
    it_behaves_like 'writer', [Entity.new(Random.rand(10))]

    it "assigns each item's #map as self" do
      entities = [Entity.new, Entity.new]
      instance.entities = entities

      entities.each { |e| e.map.should eq instance }
    end
  end

  describe '#game' do
    subject { instance.game }
    it { should eq nil }
  end

  describe '#game=' do
    subject { instance.method(:game=) }
    it_behaves_like 'writer', Game.new

    it "sets #game's map as self" do
      instance.game = Game.new
      instance.game.map.should eq instance
    end

    it "does not set game's map as self twice" do
      instance.game = Game.new
      instance.game.should_not receive(:map=)

      instance.game = instance.game
    end
  end

  describe '#entities_from_tiles' do
    subject { instance.send(:entities_from_tiles) }

    it { instance.protected_methods.should include :entities_from_tiles }

    it { should eq [] }
  end
end
