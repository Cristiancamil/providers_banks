require "test_helper"

class BanksControllerTest < ActionDispatch::IntegrationTest
  test "Render a list of banks" do
    get banks_path

    assert_response :success
    assert_select '.bank', 2
  end

  test "Render a single bank" do
    get bank_path(banks(:one))

    assert_response :success
    assert_select '.name', 'Banco de Bogotá'
  end

  test "Render a new bank" do
    get new_bank_path

    assert_response :success
    assert_select 'form'
  end

  test "Create a new bank" do
    post banks_path, params: {
      bank: {
        name: "Banco AV VIllas", 
        address: "CRA 16 A 25 26", 
        phone: "123456789", 
        email: "test_bank@prueba.com", 
        web_site: "wwww.banco.com.co", 
        provider_nit: "123456789", 
        country_code: "CO", 
        department_code: "ATL", 
        city_code: "08001", 
        type_account: "Ahorro"
      }
    }

    assert_redirected_to banks_path
    assert_equal flash[:notice], 'El banco se ah creado correctamente'

  end

  test "Dont create bank" do
    post banks_path, params: {
      bank: {
        name: nil, 
        address: nil, 
        phone: nil, 
        email: nil, 
        web_site: nil, 
        provider_nit: nil, 
        country_code: nil, 
        department_code: nil, 
        city_code: nil, 
        type_account: nil
      }
    }

    assert_response :unprocessable_entity
  end

  test "Render a edit bank" do
    get edit_bank_path(providers(:one))
    assert_response :success
  end

  test "Update a bank" do
    patch bank_path(banks(:one)), params: {
      bank: {
        name: "Test Bank", 
        address: "CRA 16 A 25 26", 
        phone: "123456789", 
        email: "test_bank@prueba.com", 
        web_site: "wwww.banco.com.co", 
        provider_nit: "123456789", 
        country_code: "CO", 
        department_code: "ATL", 
        city_code: "08001", 
        type_account: "Ahorro"
      }
    }

    assert_redirected_to banks_path
    assert_equal flash[:notice], 'El banco se ah actualizado correctamente'
  end

  test "Dont update bank" do
    patch bank_path(banks(:one)), params: {
      bank: {
        name: nil, 
        address: nil, 
        phone: nil, 
        email: nil, 
        web_site: nil, 
        provider_nit: nil, 
        country_code: nil,
        department_code: nil, 
        city_code: nil,
        type_account: nil
      }
    }
    assert_response :unprocessable_entity
  end

  test "Destroy a bank" do
    assert_difference('Bank.count', -1) do
      delete bank_path(banks(:one))
    end

    assert_redirected_to banks_path
    assert_equal flash[:notice], 'El banco se ah actualizado correctamente'
  end
  
end
