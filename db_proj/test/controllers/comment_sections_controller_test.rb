require 'test_helper'

class CommentSectionsControllerTest < ActionController::TestCase
  setup do
    @comment_section = comment_sections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comment_sections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comment_section" do
    assert_difference('CommentSection.count') do
      post :create, comment_section: { recipe_section_id: @comment_section.recipe_section_id, section_comment_id: @comment_section.section_comment_id }
    end

    assert_redirected_to comment_section_path(assigns(:comment_section))
  end

  test "should show comment_section" do
    get :show, id: @comment_section
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comment_section
    assert_response :success
  end

  test "should update comment_section" do
    patch :update, id: @comment_section, comment_section: { recipe_section_id: @comment_section.recipe_section_id, section_comment_id: @comment_section.section_comment_id }
    assert_redirected_to comment_section_path(assigns(:comment_section))
  end

  test "should destroy comment_section" do
    assert_difference('CommentSection.count', -1) do
      delete :destroy, id: @comment_section
    end

    assert_redirected_to comment_sections_path
  end
end
