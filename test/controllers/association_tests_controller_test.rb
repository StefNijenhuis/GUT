require 'test_helper'

class AssociationTestsControllerTest < ActionController::TestCase
  setup do
    @association_test = association_tests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:association_tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create association_test" do
    assert_difference('AssociationTest.count') do
      post :create, association_test: { description: @association_test.description, title: @association_test.title }
    end

    assert_redirected_to association_test_path(assigns(:association_test))
  end

  test "should show association_test" do
    get :show, id: @association_test
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @association_test
    assert_response :success
  end

  test "should update association_test" do
    patch :update, id: @association_test, association_test: { description: @association_test.description, title: @association_test.title }
    assert_redirected_to association_test_path(assigns(:association_test))
  end

  test "should destroy association_test" do
    assert_difference('AssociationTest.count', -1) do
      delete :destroy, id: @association_test
    end

    assert_redirected_to association_tests_path
  end
end
