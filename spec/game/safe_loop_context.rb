shared_context :safe_loop do
  before(:all) { DesktopWindow.class_eval "def each_tick; yield; end" }
end
