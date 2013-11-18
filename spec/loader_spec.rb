require 'spec_helper'

describe Loader do
  let(:modjul) { described_class }

  it { modjul.should be_an_instance_of Module }
end
