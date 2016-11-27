class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  #include ProductsHelper
# GET /products/search
def search 
  #@recipes = Recipe.where('recipe_name LIKE ? OR recipe_writer LIKE ?', '%'+params[:search_text]+'%' ,'%'+params[:search_text]+'%')
    #redirect_to recipes_path
  end
def add_temp_prod
    #@product = Product.new(:prod_name  => params[:prodname],  :quantity => params[:prod_quantity], :mesure_unit => params[:prod_mes])
  #@product.save
  #@temp_prod_list.push @product
    #@products = Array.new if @products.nil?
    
  @tempprod = Temp_prod.new(params[:prodname] , params[:prod_quantity] , params[:prod_mes])
  $temp_prod_list.push @tempprod
  #@tempprod.product_name = params[:prodname]
  #@tempprod.save
     render '/products/recipes_products'
end
def recipes_products


  #create_prodlist
 end
  def destroy_temp_prod
    $temp_prod_list.each do |prod|
      if prod.product_name == params[:product_name]
      @product_trash = $temp_prod_list.delete(prod)
      end
    end
    @product_trash = nil
    redirect_to '/products/recipes_products'
  end
  def submit_prods
    create_prod_id
    $temp_prod_list.each do |prod|
        @product = Product.new(:prod_name  => prod.product_name, :quantity => prod.quantity, :mesure_unit => prod.mesure_unit )
        @product.save
        @recipe_prod_temp = RecipeProd.new(:recipes_id => $current_recipe, :prods_id => @product.id)
        @recipe_prod_temp.save
        $recipe_prod_id.push @product.id        
    end
    redirect_to '/recipes/' + $current_recipe.to_s + ''
  end

# GET /products
  # GET /products.json
  

  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:prod_name, :quantity, :mesure_unit)
    end
end
