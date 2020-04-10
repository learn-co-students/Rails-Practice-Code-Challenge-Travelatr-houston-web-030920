class BloggersController < ApplicationController
    
    def new
        @blogger = Blogger.new()
    end

    def create
        # age should be > 0 and bio should be over 30 chars
        Blogger.create(
            params[:blogger][:name],
            params[:blogger][:age],
            params[:blogger][:bio]
        )

        redirect_to blogger_path(Blogger.last)
    end

    def show
        @blogger = Blogger.find(params[:id])
        # add total likes for all bloggers posts
        # add link to featured post (post with the most likes)
        @likes = @blogger.posts.map {|post| post.likes}.sum
        @featured_post = @blogger.posts.max_by {|post| post.likes}
        @most_destinations = @blogger.posts.map {|post| post.destination_id}
    end

end