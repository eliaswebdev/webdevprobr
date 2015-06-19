class PostsController < ApplicationController
  # GET
  def index
  	@posts = Post.all
  end

  # POST
  def create
    @post = Post.create(post_params)
    redirect_to(posts_path, :notice => 'Post criado com sucesso!')
  end

  # GET
  def new
    @post = Post.new
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
    @post.update(post_params)
    redirect_to(posts_path, :notice => 'Post atualizado com sucesso!')
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

  private
    # Using a private method to encapsulate the permissible parameters is just a good pattern
    # since you'll be able to reuse the same permit list between create and update. Also, you
    # can specialize this method with per-user checking of permissible attributes.
    def post_params
      params.require(:post).permit(:title, :resume, :published_at, :status, :content)
    end  
end
