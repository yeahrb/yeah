require 'spec_helper'

describe BasicPhysics do
  let(:modjul) { described_class }
  let(:entity) do
    Entity.class_eval "include #{modjul.name}"
    Entity.new
  end

  it { modjul.should be_kind_of Module }

  describe '#velocity' do
    subject { entity.velocity }

    it { should eq V[0, 0, 0] }
  end

  describe '#velocity=' do
    subject { entity.method(:velocity=) }

    it_behaves_like 'writer', V[1, 2, 3]
  end

  describe '#move' do
    it "adds velocity to position" do
      entity.velocity = V[3, 6, 9]
      entity.move
      entity.position.should eq entity.velocity
    end
  end
end
