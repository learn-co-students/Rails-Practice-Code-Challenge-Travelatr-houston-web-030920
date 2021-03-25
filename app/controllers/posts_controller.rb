class PostsController < ApplicationController

    def new
        @bloggers = Blogger.all
        @destinations = Destination.all
        @post = Post.new()
    end

    # post must have a title
    # post content must be longer than 100 characters
    def create
        Post.create(
            blogger_id: params[:post][:blogger_id],
            destination_id: params[:post][:destination_id],
            title: params[:post][:title],
            content: params[:post][:content]
        )

        redirect_to post_path(Post.last)
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def update

    end

    def likes
        @post = Post.find(params[:post_id])
        @post.increment!(:likes)
        redirect_to(@post)
    end
end