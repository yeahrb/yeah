require_relative 'shared/coordinate'

describe Thing do
  include_examples :has_accessor, :height do
    let(:default) { subject.size.y }
    let(:assignables) { [10] }
  end
end
