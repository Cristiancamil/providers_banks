require "test_helper"

class BankTest < ActiveSupport::TestCase
  test "Query a list of banks" do
    banks = Bank.all
    assert banks.present?
  end

  test "Query a single bank" do
    bank = Bank.first
    assert bank.present?
  end

  test "Create bank" do
    bank = Bank.create(
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
    )
    assert bank.present?
  end

  test "Update bank" do
    bank = Bank.find_by(provider_nit: "1052092969")
    assert_not_nil bank, "Banks #{bank.name} not found"

    bank.update(
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
    )

    assert bank.valid?, "Bank #{Bank.name} was updated successfully"
  end
  
  test "Delete bank" do
    bank = Bank.find_by(provider_nit: "1052092969")

    assert_not_nil bank, "Bank #{bank.name} was not"

    bank.destroy

    assert_nil Bank.find_by(provider_nit: "123456789"), "nit #{bank.name} was deleted successfully"
  end

end
