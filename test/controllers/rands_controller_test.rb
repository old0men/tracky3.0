require "test_helper"

class RandsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rand = rands(:one)
  end

  test "should get index" do
    get rands_url
    assert_response :success
  end

  test "should get new" do
    get new_rand_url
    assert_response :success
  end

  test "should create rand" do
    assert_difference("Rand.count") do
      post rands_url, params: { rand: { age: @rand.age, height: @rand.height, name: @rand.name } }
    end

    assert_redirected_to rand_url(Rand.last)
  end

  test "should show rand" do
    get rand_url(@rand)
    assert_response :success
  end

  test "should get edit" do
    get edit_rand_url(@rand)
    assert_response :success
  end

  test "should update rand" do
    patch rand_url(@rand), params: { rand: { age: @rand.age, height: @rand.height, name: @rand.name } }
    assert_redirected_to rand_url(@rand)
  end

  test "should destroy rand" do
    assert_difference("Rand.count", -1) do
      delete rand_url(@rand)
    end

    assert_redirected_to rands_url
  end
end
