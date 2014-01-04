describe String, '#classify' do
  it { "AwesomeClass".classify.should eq "AwesomeClass" }
  it { "ultra_class".classify.should eq "UltraClass" }
end
