require 'yeah'
include Yeah

shared_examples 'writer' do |value|
  it "assigns its reader" do
    writer = subject
    reader_name = writer.name[0..-2].to_sym
    reader = writer.receiver.method(reader_name)

    writer.call(value)
    reader.call.should eq value
  end
end

class DummyEntity < Entity
  attr_reader :update_count, :draw_count

  def initialize
    super
    @update_count = 0
    @draw_count = 0
  end

  def update
    @update_count += 1
  end

  def draw
    @draw_count += 1
  end
end

describe DummyEntity do
  let(:klass) { described_class }
  let(:instance) { klass.new }

  describe '#update_count' do
    subject { instance.update_count }

    it { should eq 0 }

    it "increments after calling #update" do
      3.times do |i|
        instance.update
        instance.update_count.should eq i+1
      end
    end
  end

  describe '#draw_count' do
    subject { instance.draw_count }

    it { should eq 0 }

    it "increments after calling #draw" do
      3.times do |i|
        instance.draw
        instance.draw_count.should eq i+1
      end
    end
  end
end
