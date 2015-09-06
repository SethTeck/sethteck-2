class PostsController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create]

	def index
		@posts = Post.all.paginate(:page => params[:page], :per_page => 1).order('created_at DESC')
	end

	def new
		@post = Post.new
	end

	def create
		current_user.posts.create(post_params)
		redirect_to root_path
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update_attributes(post_params)
		redirect_to Post.find(params[:id])
	end

	def about
	end

	private

	def post_params
		params.require(:post).permit(:title, :blogpost)
	end

end
