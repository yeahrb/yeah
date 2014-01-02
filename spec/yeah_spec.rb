require 'spec_helper'

describe Yeah do
  let(:modjul) { described_class }

  it { modjul.should be_instance_of Module }

  describe '::VERSION' do
    subject { modjul::VERSION }

    it { should be_instance_of String }
    it { should match /[0-9]+\.[0-9]+\.[0-9]+/ }
  end
end
