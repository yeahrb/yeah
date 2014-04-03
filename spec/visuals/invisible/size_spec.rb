describe Invisible do
  include_examples :has_accessor, :size do
    let(:default) { V[] }
    let(:assignables) { [V[9, 5, 3]] }
  end
end
