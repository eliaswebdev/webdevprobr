class CategoriesController < ApplicationController

	def index
		@categories = Category.all
		# render :list
	end

	def create
		@category = Category.create(category_params)
		redirect_to(categories_path, :notice => 'A categoria foi criada com sucesso!')
	end

	def new
		@category = Category.new
	end

	def edit
		@category = Category.find(params[:id])
	end

	def show
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		@category.update(category_params)
		redirect_to(categories_path, :notice => 'A categoria foi atualizada com sucesso!')
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to(categories_path, :notice => 'A categoria foi excluida com sucesso!')
	end

	private
		def category_params
			params.require(:category).permit(:name)
		end

end