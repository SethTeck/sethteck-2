class PostsController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		current_user.posts.create(post_params)
		redirect_to root_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :blogpost)
	end

end
