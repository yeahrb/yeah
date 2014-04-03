describe Thing, '#mouse' do
  its(:mouse) { should eq subject.game.context.mouse }

  its(:private_methods) { should include :mouse }
end
