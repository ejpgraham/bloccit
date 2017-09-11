class PostsController < ApplicationController
  def index
    @posts = Post.all
    i = 1
    @posts.each do |post|
      post.title = "SPAM" if i % 5 == 0
      i+= 1
    end
  end

  def show

  end

  def new
  end

  def edit
  end
end
