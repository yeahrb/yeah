require 'spec_helper'

describe Yeah::Shape do
  let(:klass) { Yeah::Shape }

  it { klass.should be_kind_of Class }

  describe '::new' do
    subject(:method) { klass.method(:new) }

    it "complains without arguments" do
      expect { method.call }.
        to raise_error ArgumentError, /too few arguments/
    end
  end
end
