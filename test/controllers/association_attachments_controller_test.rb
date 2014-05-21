require 'test_helper'

class AssociationAttachmentsControllerTest < ActionController::TestCase
  setup do
    @association_attachment = association_attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:association_attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create association_attachment" do
    assert_difference('AssociationAttachment.count') do
      post :create, association_attachment: { association_test_id: @association_attachment.association_test_id, image: @association_attachment.image }
    end

    assert_redirected_to association_attachment_path(assigns(:association_attachment))
  end

  test "should show association_attachment" do
    get :show, id: @association_attachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @association_attachment
    assert_response :success
  end

  test "should update association_attachment" do
    patch :update, id: @association_attachment, association_attachment: { association_test_id: @association_attachment.association_test_id, image: @association_attachment.image }
    assert_redirected_to association_attachment_path(assigns(:association_attachment))
  end

  test "should destroy association_attachment" do
    assert_difference('AssociationAttachment.count', -1) do
      delete :destroy, id: @association_attachment
    end

    assert_redirected_to association_attachments_path
  end
end
