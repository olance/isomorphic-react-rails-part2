class PostsController < ApplicationController

  def index
    @application_state[:posts] = Post.all
  end

end
