class CategoriesController < ApplicationController

	def index
		@categories = Category.all
		# render :list
	end

end