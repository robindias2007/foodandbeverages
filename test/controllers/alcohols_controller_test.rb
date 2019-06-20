require 'test_helper'

class AlcoholsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alcohol = alcohols(:one)
  end

  test "should get index" do
    get alcohols_url
    assert_response :success
  end

  test "should get new" do
    get new_alcohol_url
    assert_response :success
  end

  test "should create alcohol" do
    assert_difference('Alcohol.count') do
      post alcohols_url, params: { alcohol: { category: @alcohol.category, high_price: @alcohol.high_price, low_price: @alcohol.low_price, name: @alcohol.name, quantity: @alcohol.quantity, standard_price: @alcohol.standard_price, weight: @alcohol.weight } }
    end

    assert_redirected_to alcohol_url(Alcohol.last)
  end

  test "should show alcohol" do
    get alcohol_url(@alcohol)
    assert_response :success
  end

  test "should get edit" do
    get edit_alcohol_url(@alcohol)
    assert_response :success
  end

  test "should update alcohol" do
    patch alcohol_url(@alcohol), params: { alcohol: { category: @alcohol.category, high_price: @alcohol.high_price, low_price: @alcohol.low_price, name: @alcohol.name, quantity: @alcohol.quantity, standard_price: @alcohol.standard_price, weight: @alcohol.weight } }
    assert_redirected_to alcohol_url(@alcohol)
  end

  test "should destroy alcohol" do
    assert_difference('Alcohol.count', -1) do
      delete alcohol_url(@alcohol)
    end

    assert_redirected_to alcohols_url
  end
end
