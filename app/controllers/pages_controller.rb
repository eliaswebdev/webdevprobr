class PagesController < ApplicationController
  before_action :set_page, only: [:show]

  def welcome
    @posts = Post.order('published_at DESC').page(params[:page]).per(10)
  end

  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

end
