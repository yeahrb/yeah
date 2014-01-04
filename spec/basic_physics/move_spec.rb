describe BasicPhysics, '#move' do
  let(:entity) do
    Entity.class_eval "include #{described_class.name}"
    Entity.new
  end

  it "adds velocity to position" do
    entity.velocity = V[3, 6, 9]
    entity.move
    entity.position.should eq entity.velocity
  end
end
