require 'spec_helper'

describe Surface do
  let(:klass) { described_class }
  let(:vector) { Vector[Random.rand(50)+1, Random.rand(50)+1] }
  let(:instance) { klass.new(vector) }

  describe '::new' do
    subject(:method) { klass.method :new }

    it { expect { method.call }.to raise_error ArgumentError }

    it "accepts a Vector size" do
      vector = Vector[Random.rand(20), Random.rand(20)]
      surface = method.call(vector)
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

    it "is repeatedly \x00\x00\x00\xFF by default" do
      pixels = data.unpack('H*')[0].scan(/.{8}/)
      pixels.uniq.size.should eq 1
      pixels.first.should eq "000000ff"
    end
  end
end
