require "test_helper"

class ProvidersControllerTest < ActionDispatch::IntegrationTest
  test "Render a array of providers" do
    get providers_path

    assert_response :success
    assert_select '.provider', 2
  end

  test "Render a single provider" do
    get provider_path(providers(:one))

    assert_response :success
    assert_select '.name', 'Cristian Camilo'
  end

  test "Render a new provider" do
    get new_provider_path

    assert_response :success
    assert_select 'form'
  end

  test "Create a new provider" do
    post providers_path, params: {
      provider: {
        name: 'Cristian Camilo',
        nit: '1052092970',
        name_contact: 'Mercedes Martinez',
        phone_contact: '3043593810',
        account_number: '08000003973'
      }
    }
    assert_redirected_to providers_path
    assert_equal flash[:notice], 'Provider was successfully created'
  end

  test "Render a edit provider" do
    get edit_provider_path(providers(:one))

    assert_response :success
    assert_select 'form'
  end

  test "Update a provider" do
    patch provider_path(providers(:one)), params: {
      provider: {
        name: 'Cristian Camilo',
        nit: '1052092971',
        name_contact: 'Mercedes Martinez',
        phone_contact: '3043593810',
        account_number: '08000003973'
      }
    }
    assert_redirected_to providers_path
    assert_equal flash[:notice], 'Provider was successfully updated'
  end

  test "Destroy a provider" do
    assert_difference('Provider.count', -1) do
      delete provider_path(providers(:one))
    end

    assert_redirected_to providers_path
    assert_equal flash[:notice], 'Provider was successfully destroyed'
  end

end
