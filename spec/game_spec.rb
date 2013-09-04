require 'spec_helper'

describe Yeah::Game do
  let(:klass) { Yeah::Game }
  let(:instance) { klass.new }

  it { klass.should be_instance_of Class }
end
