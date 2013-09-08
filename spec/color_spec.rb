require 'spec_helper'

describe Yeah::Color do
  let(:modjul) { Yeah::Color }

  it { modjul.should be_kind_of Module }

  describe '::byte_array' do
    subject(:method) { modjul.method(:byte_array) }

    it { method.call([10, 20, 30, 40]).should eq [10, 20, 30, 40] }
    it { method.call([255, 255, 255, 255]).should eq [255, 255, 255, 255] }
    it { method.call('00FF01FE').should eq [0, 255, 1, 254] }
    it { method.call('11223344').should eq [17, 34, 51, 68] }
  end
end
