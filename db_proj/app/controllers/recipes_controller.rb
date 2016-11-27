class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json



  def add_comment
    #@comments = Comment.where(:refers_to =>  1)

 #@product = Product.new(:prod_name  => prod.product_name, :quantity => prod.quantity, :mesure_unit => prod.mesure_unit )
    #@comment = Comment.new( )
    @comment = Comment.new(:comment_text => params[:comment_text],:refers_to =>  1 ,:comment_user => session[:user_id])
    @comment.save
    @comment_sect = CommentSection.new(:recipe_section_id => $current_recipe, :section_comment_id => @comment.id)
    @comment_sect.save
    #@comment.save
    @recipe = Recipe.find_by(:id => $current_recipe)
    redirect_to '/recipes/' + $current_recipe.to_s + ''
  end
  def search 
  @recipes = Recipe.where('recipe_name LIKE ? OR recipe_writer LIKE ?', '%'+params[:search_text]+'%' ,'%'+params[:search_text]+'%')
    #redirect_to recipes_path
  end
  
  def search_my_recipes
    @recipes = Recipe.find_by(:username , session[:user_id])
  end
  
  def search_by_name
    @recipes = Recipe.find_by(:username , session[:user_id])
  end
  def index
    @recipes = Recipe.all

  end
  def delete_comment
    @comment = Comment.find_by(:id  => params[:comment_id])
    @comment.update(:comment_text => 'comment deleted')

    redirect_to '/recipes/' + $current_recipe.to_s + ''
  end
def view
end
  # GET /recipes/1
  # GET /recipes/1.json
  def show
  #  @prods = Product.find_by_sql(:conditions => ["WHERE id in (
#SELECT prods_id 
#FROM recipe_prods 
#WHERE recipes_id=49
#)"])
   $current_recipe = @recipe.id
    @prods_id = RecipeProd.where("recipes_id = :recip_id", recip_id: $current_recipe)
    @comments = CommentSection.where("recipe_section_id = :recipe_id",recipe_id: $current_recipe)

    #render '/recipes/view'
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.recipe_writer = session[:user_id]

    respond_to do |format|
      if @recipe.save
        create_prodlist
        current_recipe @recipe.id
        format.html { redirect_to '/products/recipes_products', notice: 'Recipe was successfully created.' }
        format.json { render '/products/recipes_products', status: :created, location: '/products/recipes_products' }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:recipe_name, :description)
    end
end
