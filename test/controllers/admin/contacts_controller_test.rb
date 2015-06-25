require 'test_helper'

class Admin::ContactsControllerTest < ActionController::TestCase
  setup do
    @admin_contact = admin_contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_contact" do
    assert_difference('Admin::Contact.count') do
      post :create, admin_contact: {  }
    end

    assert_redirected_to admin_contact_path(assigns(:admin_contact))
  end

  test "should show admin_contact" do
    get :show, id: @admin_contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_contact
    assert_response :success
  end

  test "should update admin_contact" do
    patch :update, id: @admin_contact, admin_contact: {  }
    assert_redirected_to admin_contact_path(assigns(:admin_contact))
  end

  test "should destroy admin_contact" do
    assert_difference('Admin::Contact.count', -1) do
      delete :destroy, id: @admin_contact
    end

    assert_redirected_to admin_contacts_path
  end
end
