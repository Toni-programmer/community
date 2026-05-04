require "test_helper"

class CashBalancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cash_balance = cash_balances(:one)
  end

  test "should get index" do
    get cash_balances_url
    assert_response :success
  end

  test "should get new" do
    get new_cash_balance_url
    assert_response :success
  end

  test "should create cash_balance" do
    assert_difference("CashBalance.count") do
      post cash_balances_url, params: { cash_balance: { community_id: @cash_balance.community_id, current_amount: @cash_balance.current_amount, financial_year: @cash_balance.financial_year, status: @cash_balance.status } }
    end

    assert_redirected_to cash_balance_url(CashBalance.last)
  end

  test "should show cash_balance" do
    get cash_balance_url(@cash_balance)
    assert_response :success
  end

  test "should get edit" do
    get edit_cash_balance_url(@cash_balance)
    assert_response :success
  end

  test "should update cash_balance" do
    patch cash_balance_url(@cash_balance), params: { cash_balance: { community_id: @cash_balance.community_id, current_amount: @cash_balance.current_amount, financial_year: @cash_balance.financial_year, status: @cash_balance.status } }
    assert_redirected_to cash_balance_url(@cash_balance)
  end

  test "should destroy cash_balance" do
    assert_difference("CashBalance.count", -1) do
      delete cash_balance_url(@cash_balance)
    end

    assert_redirected_to cash_balances_url
  end
end
