class DestinationsController < ApplicationController

    def show
        @destination = Destination.find(params[:id])
        @posts = @destination.posts.limit(5).reverse

        age = @destination.bloggers.map{|blogger| blogger.age}
        @average_age = age.sum / age.length

        @featured_post = @destination.posts.max_by{|post| post.likes}
    end

end