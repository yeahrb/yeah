shared_context :boundary_klass do
  let(:klass) { Class.new { |c| c.send(:include, Boundary) } }
end
