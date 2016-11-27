class RecipeProdsController < ApplicationController
  before_action :set_recipe_prod, only: [:show, :edit, :update, :destroy]

  # GET /recipe_prods
  # GET /recipe_prods.json
  def index
    @recipe_prods = RecipeProd.all
  end

  # GET /recipe_prods/1
  # GET /recipe_prods/1.json
  def show
  end

  # GET /recipe_prods/new
  def new
    @recipe_prod = RecipeProd.new
  end

  # GET /recipe_prods/1/edit
  def edit
  end

  # POST /recipe_prods
  # POST /recipe_prods.json
  def create
    @recipe_prod = RecipeProd.new(recipe_prod_params)

    respond_to do |format|
      if @recipe_prod.save
        format.html { redirect_to @recipe_prod, notice: 'Recipe prod was successfully created.' }
        format.json { render :show, status: :created, location: @recipe_prod }
      else
        format.html { render :new }
        format.json { render json: @recipe_prod.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_prods/1
  # PATCH/PUT /recipe_prods/1.json
  def update
    respond_to do |format|
      if @recipe_prod.update(recipe_prod_params)
        format.html { redirect_to @recipe_prod, notice: 'Recipe prod was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe_prod }
      else
        format.html { render :edit }
        format.json { render json: @recipe_prod.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_prods/1
  # DELETE /recipe_prods/1.json
  def destroy
    @recipe_prod.destroy
    respond_to do |format|
      format.html { redirect_to recipe_prods_url, notice: 'Recipe prod was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_prod
      @recipe_prod = RecipeProd.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_prod_params
      params.require(:recipe_prod).permit(:recipes_id, :prods_id)
    end
end
