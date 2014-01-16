describe Utility, '#extend_string' do
  let(:extend_string) { subject.method(:extend_string) }

  it "accepts frozen string" do
    frozen = "brr".freeze
    expect { extend_string.call(frozen) }.to_not raise_error
  end

  describe 'String#classify' do
    it { extend_string.call('ultra_class').classify.should eq 'UltraClass' }
    it { extend_string.call('CoolClass').classify.should eq 'CoolClass' }
  end

  describe 'String#unindent' do
    it { extend_string.call("konichiwa").unindent.should eq "konichiwa" }
    it { extend_string.call("\thola").unindent.should eq "hola" }
    it { extend_string.call("ni\n\n\nhao").unindent.should eq "ni\n\n\nhao" }
    it do
      indented = "\tdzien\n\t\tdobry"
      unindented = extend_string.call(indented).unindent

      expect(unindented).to eq "dzien\n\tdobry"
    end
  end
end
