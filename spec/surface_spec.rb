require 'spec_helper'

describe Surface do
  let(:klass) { described_class }
  let(:vector) { Vector[Random.rand(48)+2, Random.rand(48)+2] }
  let(:instance) { klass.new(vector) }

  describe '::new' do
    subject(:method) { klass.method :new }

    it { method.call.size.should eq Vector[] }

    it "accepts a Vector size" do
      surface = method.call(vector)
      surface.size.should eq vector
    end
  end

  describe '#size' do
    subject { instance.size }

    it { should eq vector }
  end

  describe '#size=' do
    subject(:method) { instance.method(:size=) }

    it_behaves_like 'writer', Vector[20, 20]
  end

  describe '#data' do
    subject(:data) { instance.data }

    it "has length of #size.x * #size.y * 4" do
      instance.size = instance.size * 2
      expected_length = instance.size.x * instance.size.y * 4
      data.length.should eq expected_length
    end

    it "is a series of \x00\x00\x00\x00 by default" do
      pixels = data.unpack('H*')[0].scan(/.{8}/)
      pixels.uniq.size.should eq 1
      pixels.uniq.last.should eq "00000000"
    end
  end

  describe '#data=' do
    subject(:method) { instance.method(:data=) }

    it "assigns hex data of length size.x * size.y * 4" do
      data = "\xFF" * instance.size.x * instance.size.y * 4
      method.call(data)
      instance.data.should eq data
    end
  end

  describe '#color_at' do
    subject(:method) { instance.method(:color_at) }

    it { expect { method.call }.to raise_error ArgumentError }

    it "matches the color of the pixel at position" do
      method.call(vector/2).should eq Color[0, 0, 0, 0]
    end
  end

  describe '#fill_rectangle' do
    subject(:method) { instance.method(:fill_rectangle) }

    it { expect { method.call }.to raise_error ArgumentError }
    it { expect { method.call(vector) }.to raise_error ArgumentError }
    it { expect { method.call(vector, vector) }.to raise_error ArgumentError }

    it "changes color of rectangular area" do
      color2 = Color[0, 255, 0, 255]
      method.call(Vector[], vector/2, color2)
      instance.color_at(Vector[]).should eq color2
      instance.color_at(vector/2).should eq color2
      instance.color_at(vector/2 + Vector[1, 0]).should eq Color[0, 0, 0, 0]
      instance.color_at(vector/2 + Vector[0, 1]).should eq Color[0, 0, 0, 0]
      instance.data.length.should eq instance.size.x * instance.size.y * 4
    end
  end
end
