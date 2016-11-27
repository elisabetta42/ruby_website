class UserAccountsController < ApplicationController
  before_action :set_user_account, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:show, :edit, :update]
  
def possible_recipes
  @myprods = Product.where(id: Inventory.where(owner_user_name: session[:user_id]))
end
def inventory
  @prods = Inventory.where("owner_user_name = :username", username: session[:user_id])
end

  def add_prod
      @product = Product.new(:prod_name  => params[:prodname], :quantity => params[:prod_quantity], :mesure_unit => params[:prod_mes])
        
        @product.save
        @inventory = Inventory.new(:owner_user_name => session[:user_id], :product_id => @product.id)
        @inventory.save
        redirect_to user_inventory_path
  end
  def destroy_prod
    @prod_dest = Product.find_by(:id => params[:product_id])
    @prod_dest.destroy
    redirect_to user_inventory_path
  end

  # GET /user_accounts
  # GET /user_accounts.json
  def index
    @user_accounts = UserAccount.all
  end

  # GET /user_accounts/1
  # GET /user_accounts/1.json
  def show
      @user_account= UserAccount.find_by(username: session[:user_id])
      @recipes = Recipe.where("recipe_writer = :writer", writer: session[:user_id]) 
  end

  # GET /user_accounts/new
  def new
    @user_account = UserAccount.new
  end

  # GET /user_accounts/1/edit
  def edit
  end

  # POST /user_accounts
  # POST /user_accounts.json
  def create
    @user_account = UserAccount.new(user_account_params)

    respond_to do |format|
      if @user_account.save
        format.html { redirect_to @user_account, notice: 'User account was successfully created.' }
        format.json { render :show, status: :created, location: @user_account }
      else
        format.html { render :new }
        format.json { render json: @user_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_accounts/1
  # PATCH/PUT /user_accounts/1.json
  def update
    respond_to do |format|
      if @user_account.update(user_account_params)
        format.html { redirect_to @user_account, notice: 'User account was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_account }
      else
        format.html { render :edit }
        format.json { render json: @user_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_accounts/1
  # DELETE /user_accounts/1.json
  def destroy
    @user_account.destroyproj
    respond_to do |format|
      format.html { redirect_to user_accounts_url, notice: 'User account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_account
      @user_account = UserAccount.find_by(username: session[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_account_params
      params.require(:user_account).permit(:username, :password, :email, :level)
    end
end
