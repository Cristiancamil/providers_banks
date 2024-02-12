require "test_helper"

class ProviderTest < ActiveSupport::TestCase
  
  test "Render a list of providers" do
    provider = Provider.all
    assert provider.present?
  end

  test "Render a single provider" do
    provider = Provider.first
    assert provider.present?
  end

  test "Save a provider" do
    provider = Provider.create(
      name: "Test Provider",
      nit: "123456789",
      name_contact: "Test Provider",
      phone_contact: "123456789",
      account_number: "123456789"
    )

    assert provider.save, "Provider #{provider.name} was saved successfully"
  end

  test "Update a provider" do

    provider = Provider.find_by(nit: "1052092969")
    assert_not_nil provider, "Provider #{provider.name} was not"

    provider.update(
      name: "Test Provider",
      nit: "123456789",
      name_contact: "Test Provider",
      phone_contact: "123456789",
    )
    p "Provider #{provider.name} was updated successfully"
    assert provider.valid?, "Provider #{provider.name} was updated successfully"
  end

  test "Delete a provider" do
    provider = Provider.find_by(nit: "1052092969")

    assert_not_nil provider, "Provider #{provider.name} was not"

    provider.destroy

    assert_nil Provider.find_by(nit: "1052092969"), "Provider #{provider.name} was deleted successfully"
  end

end
