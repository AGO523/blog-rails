class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[index show]
  before_action :ensure_user, only: %i[edit update destroy]
  before_action :admin_confirmation, only: %i[edit update destroy new]

  # GET /posts or /posts.json
  def index
    
    # @post_search_form = PostSearchForm.new(post_search_form_params)
    # if @post_search_form.present?
    #   @posts = @post_search_form.search
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).published.page(params[:page]).per(8).order(created_at: :desc)
    else
      @posts = Post.with_rich_text_cotent.page(params[:page]).published.per(8).order(created_at: :desc)
    end

    @tags = Post.tags_on(:tags)
  end

  # GET /posts/1 or /posts/1.json
  def show
    @comments = @post.comments
    @comment = Comment.new
    @tags = Post.tags_on(:tags)
  end

  # GET /posts/new
  def new
    @post = Post.new(status: draft)
    @post.published! if @post.save
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:cotent, :top_image, :title, :tag_list, :status)
    end

    def ensure_user
      @posts = current_user.posts
      @post = @posts.find_by(id: params[:id])
      redirect_to new_post_path unless @post
    end

    def post_search_form_params
      params.fetch(:post_search_form, {}).permit(:keyword, :title).merge(page: params[:page])
    end

    def admin_confirmation
      unless current_user.admin == true
        redirect_to root_path
      end
    end

    def switch_status
      @post.switch_status!
      redirect_to root_path, notice: '????????????????????????????????????'
    end
end
