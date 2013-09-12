require 'spec_helper'

describe Surface do
  let(:klass) { described_class }
  let(:instance) { klass.new }

  describe '::new' do
    subject(:method) { klass.method :new }

    it { expect { method.call }.to raise_error ArgumentError }

    it "accepts a Vector size" do
      vector = Vector[Random.rand(20), Random.rand(20)]
      surface = method.call(vector)
    end
  end
end
