class AssetTest < Test
  def setup
    @class = Asset
    @object = @class[]
  end

  def test_implements_asset_interface
    assert_respond_to(@class, :[])

    assert_respond_to(@object, :path)
  end
end
