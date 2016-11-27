require 'test_helper'

class RecipesProductsControllerTest < ActionController::TestCase
  setup do
    @recipes_product = recipes_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recipes_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recipes_product" do
    assert_difference('RecipesProduct.count') do
      post :create, recipes_product: { recipe_id: @recipes_product.recipe_id, recipe_prod_id: @recipes_product.recipe_prod_id }
    end

    assert_redirected_to recipes_product_path(assigns(:recipes_product))
  end

  test "should show recipes_product" do
    get :show, id: @recipes_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recipes_product
    assert_response :success
  end

  test "should update recipes_product" do
    patch :update, id: @recipes_product, recipes_product: { recipe_id: @recipes_product.recipe_id, recipe_prod_id: @recipes_product.recipe_prod_id }
    assert_redirected_to recipes_product_path(assigns(:recipes_product))
  end

  test "should destroy recipes_product" do
    assert_difference('RecipesProduct.count', -1) do
      delete :destroy, id: @recipes_product
    end

    assert_redirected_to recipes_products_path
  end
end
