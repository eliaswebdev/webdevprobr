class PostsController < ApplicationController
  # GET
  def index
    if params[:category].present?
      @posts = Post.where(category: params[:category]).order('id DESC').page(params[:page]).per(10)
  	else
      @posts = Post.order('id DESC').page(params[:page]).per(10)
    end
  end

  # GET
  def new
    @post = Post.new
  end

  # POST
  def create
    @post = Post.create(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET
  def edit
    @post = Post.find(params[:id])
  end

  # GET
  def show
  	# @post = Post.find_by(id: params[:id])
  	# redirect_to(posts_path, :notice => 'Record not found') unless @post.present?
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to(posts_path, :notice => 'Post não encontrado!')
  end

  # PUT
  # PATCH
  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to posts_path, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE
  def destroy
    begin
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to(posts_path, :notice => 'O post foi excluido com sucesso!')
    rescue ActiveRecord::RecordNotFound
      redirect_to(posts_path, :notice => 'Post não encontrado!')
    end
  end

  def comentar
    @parametros_do_formulario = params
    
    @post = Post.find(params[:comment][:post_id])
    params[:comment][:ip] = request.remote_ip

    Comment.create(comment_params)
    
    redirect_to(@post, :notice => 'O comentário foi enviado com sucesso!')

    # @post.comments.create(
    #   name: params[:name],
    #   email: params[:email],
    #   content: params[:content]
    # )
  end

  private
    # Using a private method to encapsulate the permissible parameters is just a good pattern
    # since you'll be able to reuse the same permit list between create and update. Also, you
    # can specialize this method with per-user checking of permissible attributes.
    def post_params
      # params.require(:post).permit!
      params.require(:post).permit(:category_id, :title, :resume, :published_at, :status, :content)
    end

    def comment_params
      params.require(:comment).permit(:post_id, :name, :email, :content, :ip)      
    end
end





