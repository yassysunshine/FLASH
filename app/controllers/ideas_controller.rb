class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]
  before_action :login_check, only: [:new, :edit, :update, :destroy, :show]


  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.page(params[:page]).per(2)
    @search = Idea.ransack(params[:q])
    @result = @search.result.page(params[:page]).per(2)
  end

  def search
    @search = Idea.search(search_params)
    @result = @search.result(distinct: true)
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @favorite = current_user.favorites.find_by(idea_id: @idea.id)
  end

  # GET /ideas/new
  def new
    if params[:back]
      @idea = Idea.new(idea_params)
    else
      @idea = Idea.new
      @seeds = Seed.where( 'id >= ?', rand(Seed.count)).sample(2)
    end
  end

  # GET /ideas/1/edit
  def edit
  end
  
  def confirm
    @idea = Idea.new(idea_params)
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(idea_params)
    @idea.user_id = current_user.id
    
    
    respond_to do |format|
      if @idea.save
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url, notice: 'Idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:title, :content, :image, :favorite_id, :seed_name1, :seed_name2, :image_cache)
    end

    def search_params
      params.require(:q).permit!
    end
    
    def login_check
      unless current_user.present?
        flash[:alert] = "ログインしてください"
        redirect_to root_path
      end
    end
end