class PostsController < ApplicationController
  # GET
  def index
  	@posts = Post.all
  end

  # POST
  def create  	
  end

  # GET
  def new
  end

  # GET
  def edit
  end

  # GET
  def show
  	# @post = Post.find_by(id: params[:id])
  	# redirect_to(posts_path, :notice => 'Record not found') unless @post.present?
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to(posts_path, :notice => 'Post não encontrado!')
  end

  # PATCH
  def update
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
end
