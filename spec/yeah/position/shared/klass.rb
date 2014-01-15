shared_context :position_klass do
  let(:klass) { Class.new { |c| c.send(:include, Position) } }
end
