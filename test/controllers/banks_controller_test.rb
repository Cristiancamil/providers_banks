require "test_helper"

class BanksControllerTest < ActionDispatch::IntegrationTest
  test "Render a list of banks" do
    get banks_path
    assert_response :success
  end

  test "Render a single bank" do
    get bank_path(banks(:one))
    assert_response :success
  end

  test "Render a new bank" do
    get new_bank_path
    assert_response :success
  end

  test "Create a new bank" do
    post banks_path, params: {
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
    assert_response :success
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
    assert_response :success
  end

  test "Destroy a bank" do
    assert_difference('Bank.count', -1) do
      delete bank_path(banks(:one))
    end

    # assert_redirected_to banks_path
    assert_response :success
  end
end
