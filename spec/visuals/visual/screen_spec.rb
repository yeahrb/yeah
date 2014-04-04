describe Visual, '#screen' do
  its(:screen) { should eq subject.thing.game.context.screen }

  its(:private_methods) { should include :screen }
end
