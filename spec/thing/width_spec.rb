require_relative 'shared/coordinate'

describe Thing do
  include_examples :has_accessor, :width do
    let(:default) { subject.size.x }
    let(:assignables) { [5] }
  end
end
