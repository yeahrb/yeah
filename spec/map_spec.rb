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

  describe '#background' do
    subject { instance.background }
    it { should eq Color[] }
  end

  describe '#background=' do
    subject(:method) { instance.method(:background=) }
    it_behaves_like 'writer', Color[*[Random.rand(255)]*4]
  end

  describe '#key' do
    subject { instance.key }
    it { should eq Hash.new }
  end

  describe '#key=' do
    subject(:method) { instance.method(:key=) }
    it_behaves_like 'writer', { '#' => Entity }
  end
end
