require_relative 'shared/coordinate'

describe Thing do
  include_examples :has_accessor, :x do
    let(:default) { subject.position.x }
    let(:assignables) { [20] }
  end
end
