require 'spec_helper'

describe Map do
  let(:klass) { described_class }
  let(:instance) { klass.new }

  it { klass.should be_instance_of Class }

  describe '::background' do
    after(:each) { klass.class_variable_set :@@background, nil }

    it { expect{klass.background}.to raise_error ArgumentError }

    it "assigns #background in instances" do
      background = :black
      klass.background(background)
      klass.new.background.should eq background
    end
  end

  describe '::key' do
    after(:each) { klass.class_variable_set :@@key, nil }

    it { expect{klass.key}.to raise_error ArgumentError }

    it "assigns #key in instances" do
      key = { '#' => Entity }
      klass.key(key)
      klass.new.key.should eq key
    end
  end

  describe '::tile_size' do
    after(:each) { klass.class_variable_set :@@tile_size, nil }

    it { expect{klass.tile_size}.to raise_error ArgumentError }

    it "assigns #tile_size in instances" do
      tile_size = V[16, 16]
      klass.tile_size(tile_size)
      klass.new.tile_size.should eq tile_size
    end
  end

  describe '::tiles' do
    after(:each) { klass.class_variable_set :@@tiles, nil }

    it { expect{klass.tiles}.to raise_error ArgumentError }

    it "assigns #tiles in instances" do
      tiles = ["###"]
      klass.tiles(tiles)
      klass.new.tiles.should eq tiles
    end
  end

  describe '#background' do
    subject { instance.background }
    it { should eq Color[] }
  end

  describe '#background=' do
    subject { instance.method(:background=) }
    it_behaves_like 'writer', Color[*[Random.rand(255)]*4]
  end

  describe '#key' do
    subject { instance.key }
    it { should eq Hash.new }
  end

  describe '#key=' do
    subject { instance.method(:key=) }
    it_behaves_like 'writer', { '#' => Entity }
  end

  describe '#tile_size' do
    subject { instance.tile_size }

    it { should eq nil }

    it "is implied by #key's first entity's size after #key is set from nil" do
      class Pseudoentity
        def size; V[5, 10, 15]; end
      end
      instance.key = { '#' => Pseudoentity }
      instance.tile_size.should eq Pseudoentity.new.size
    end
  end

  describe '#tile_size=' do
    subject { instance.method(:tile_size=) }
    it_behaves_like 'writer', V[16, 16]
  end

  describe '#tiles' do
    subject { instance.tiles }
    it { should eq [] }
  end

  describe '#tiles=' do
    subject { instance.method(:tiles=) }
    it_behaves_like 'writer', ["###"]
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
  end
end
