require 'spec_helper'

describe Surface do
  let(:klass) { described_class }
  let(:vector) { V.random(48, 48) + V[2, 2] }
  let(:instance) { klass.new(vector) }

  describe '::new' do
    it { klass.new.size.should eq V[] }

    it "accepts a Vector size" do
      surface = klass.new(vector)
      surface.size.should eq vector
    end
  end

  describe '#size' do
    subject { instance.size }
    it { should eq vector }
  end

  describe '#size=' do
    subject { instance.method(:size=) }
    it_behaves_like 'writer', V[20, 20]
  end

  describe '#data' do
    it "has length of #size.x * #size.y * 4" do
      instance.size = instance.size * 2
      expected_length = instance.size.x * instance.size.y * 4
      instance.data.length.should eq expected_length
    end

    it "is a series of \x00\x00\x00\x00 by default" do
      pixels = instance.data.unpack('H*')[0].scan(/.{8}/)
      pixels.uniq.size.should eq 1
      pixels.uniq.last.should eq "00000000"
    end
  end

  describe '#data=' do
    it "assigns hex data of length size.x * size.y * 4" do
      data = "\xFF" * instance.size.x * instance.size.y * 4
      instance.data = data
      instance.data.should eq data
    end
  end

  describe '#color_at' do
    it { expect {instance.color_at}.to raise_error ArgumentError }

    it "matches the color of the pixel at position" do
      instance.color_at(vector/2).should eq Color[0, 0, 0, 0]
    end
  end

  describe '#fill' do
    let(:color2) { Color[0, 255, 0, 255] }

    it { expect {instance.fill}.to raise_error ArgumentError }

    it "changes color of rectangular area with position args" do
      instance.fill(color2, V[], vector/2)
      instance.color_at(V[]).should eq color2
      instance.color_at(vector/2).should eq color2
      instance.color_at(vector/2 + V[1, 0]).should eq Color[0, 0, 0, 0]
      instance.color_at(vector/2 + V[0, 1]).should eq Color[0, 0, 0, 0]
      instance.data.length.should eq instance.size.x * instance.size.y * 4
    end

    it "changes color of entire surface without position args" do
      instance.fill(color2)
      instance.color_at(V[]).should eq color2
      instance.color_at(vector/2).should eq color2
      instance.color_at(vector-1).should eq color2
      instance.data.length.should eq instance.size.x * instance.size.y * 4
    end
  end

  describe '#draw' do
    let(:color) { Color[0, Random.rand(255), Random.rand(255), 255] }

    it { expect {instance.draw}.to raise_error ArgumentError }

    it "draws surface at position" do
      surface = Surface.new(V[1, 1])
      surface.fill(color)
      surface2 = Surface.new(V[10, 10])
      surface2.draw(surface, V[1, 1])

      surface2.color_at(V[0, 0]).should eq Color[0, 0, 0, 0]
      surface2.color_at(V[1, 1]).should eq color
      surface2.color_at(V[2, 2]).should eq Color[0, 0, 0, 0]
    end

    it "draws surface at (0, 0) by default" do
      surface = Surface.new(V[1, 1])
      surface.fill(color)
      surface2 = Surface.new(V[10, 10])
      surface2.draw(surface)

      surface2.color_at(V[0, 0]).should eq color
      surface2.color_at(V[1, 1]).should eq Color[0, 0, 0, 0]
    end

    it "draws a rectangular area" do
      surface = Surface.new(V[3, 3])
      surface.fill(color)
      surface2 = Surface.new(V[5, 5])
      surface2.draw(surface, V[1, 1])

      surface2.color_at(V[1, 1]).should eq color
      surface2.color_at(V[1, 3]).should eq color
      surface2.color_at(V[3, 1]).should eq color
      surface2.color_at(V[3, 3]).should eq color
      surface2.color_at(V[0, 3]).should eq Color[0, 0, 0, 0]
      surface2.color_at(V[3, 0]).should eq Color[0, 0, 0, 0]
      surface2.color_at(V[4, 3]).should eq Color[0, 0, 0, 0]
      surface2.color_at(V[3, 4]).should eq Color[0, 0, 0, 0]
    end
  end
end
