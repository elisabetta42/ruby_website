class CommentSectionsController < ApplicationController
  before_action :set_comment_section, only: [:show, :edit, :update, :destroy]

  # GET /comment_sections
  # GET /comment_sections.json
  def index
    @comment_sections = CommentSection.all
  end

  # GET /comment_sections/1
  # GET /comment_sections/1.json
  def show
  end

  # GET /comment_sections/new
  def new
    @comment_section = CommentSection.new
  end

  # GET /comment_sections/1/edit
  def edit
  end

  # POST /comment_sections
  # POST /comment_sections.json
  def create
    @comment_section = CommentSection.new(comment_section_params)

    respond_to do |format|
      if @comment_section.save
        format.html { redirect_to @comment_section, notice: 'Comment section was successfully created.' }
        format.json { render :show, status: :created, location: @comment_section }
      else
        format.html { render :new }
        format.json { render json: @comment_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comment_sections/1
  # PATCH/PUT /comment_sections/1.json
  def update
    respond_to do |format|
      if @comment_section.update(comment_section_params)
        format.html { redirect_to @comment_section, notice: 'Comment section was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment_section }
      else
        format.html { render :edit }
        format.json { render json: @comment_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_sections/1
  # DELETE /comment_sections/1.json
  def destroy
    @comment_section.destroy
    respond_to do |format|
      format.html { redirect_to comment_sections_url, notice: 'Comment section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_section
      @comment_section = CommentSection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_section_params
      params.require(:comment_section).permit(:recipe_section_id, :section_comment_id)
    end
end
