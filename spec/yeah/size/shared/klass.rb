shared_context :size_klass do
  let(:klass) { Class.new { |c| c.send(:include, Size) } }
end
