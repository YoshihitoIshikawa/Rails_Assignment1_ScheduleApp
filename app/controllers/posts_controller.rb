class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params.require(:post).permit(:title,:start_date,:end_date,:is_all_day,:content))
    if @post.save
      flash[:notice] = "新規予定を作成しました。"
      redirect_to :posts
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])

  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title,:start_date,:end_date,:is_all_day,:content))
      flash[:notice] = "予定を編集しました"
      redirect_to :posts
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "予定を削除しました"
    redirect_to :posts
  end
  
end
