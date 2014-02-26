describe Game, '#name' do
  let(:subgame_class) { class IGoJump < Game; end; IGoJump }

  it { subgame_class.new.name.should eq subgame_class.name }
end
