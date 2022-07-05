require "test_helper"

class Admin::GenrseControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_genrse_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_genrse_edit_url
    assert_response :success
  end
end
