class PostsController < ApplicationController
  def index
    # #11
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
# #9
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]

# #10
    if @post.save

# #11
    flash[:notice] = "Post was saved."
    redirect_to @post

  else

# #12
    flash.now[:alert] = "There was an error saving the post. Please try again."
    render :new
  end
end


  def edit
    @post = Post.find(params[:id])
  end

  def destroy
     @post = Post.find(params[:id])

 # #8
     if @post.destroy
       flash[:notice] = "\"#{@post.title}\" was deleted successfully."
       redirect_to posts_path
     else
       flash.now[:alert] = "There was an error deleting the post."
       render :show
     end
   end

  def update
    @post = Post.find(params[:id])
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]

    if @post.save
      flash[:notice] = "Post was updated."
      redirect_to @post
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  # the real end
end
