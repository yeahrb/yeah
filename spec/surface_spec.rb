require 'spec_helper'

describe Surface do
  let(:klass) { described_class }
  let(:vector) { Vector[50, 50] }
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
end
