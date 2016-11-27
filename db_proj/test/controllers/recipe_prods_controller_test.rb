require 'test_helper'

class RecipeProdsControllerTest < ActionController::TestCase
  setup do
    @recipe_prod = recipe_prods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recipe_prods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recipe_prod" do
    assert_difference('RecipeProd.count') do
      post :create, recipe_prod: { prods_id: @recipe_prod.prods_id, recipes_id: @recipe_prod.recipes_id }
    end

    assert_redirected_to recipe_prod_path(assigns(:recipe_prod))
  end

  test "should show recipe_prod" do
    get :show, id: @recipe_prod
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recipe_prod
    assert_response :success
  end

  test "should update recipe_prod" do
    patch :update, id: @recipe_prod, recipe_prod: { prods_id: @recipe_prod.prods_id, recipes_id: @recipe_prod.recipes_id }
    assert_redirected_to recipe_prod_path(assigns(:recipe_prod))
  end

  test "should destroy recipe_prod" do
    assert_difference('RecipeProd.count', -1) do
      delete :destroy, id: @recipe_prod
    end

    assert_redirected_to recipe_prods_path
  end
end
