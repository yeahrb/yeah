require 'spec_helper'

describe Yeah::Rectangle do
  let(:klass) { Yeah::Rectangle }
  let(:instance) { klass.new }

  it { klass.should be_kind_of Class }

  describe '::new' do
    subject(:method) { klass.method(:new) }

    it { method.call.should be_instance_of Yeah::Rectangle }
  end
end
