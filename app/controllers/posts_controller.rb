class PostsController < ApplicationController
  before_action :assign_post, only: [:show, :edit, :update, :destroy]

  # Listar todos los elementos
  def index
    @posts = Post.all
  end

  # Ver un solo elemento
  def show
  end

  # Nuevo Elemento
  def new
    @post = Post.new
  end

  # Crear elemento
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  # Editar
  def edit
  end

  # Update
  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  # Destroy
  def destroy
    if @post.destroy
      redirect_to posts_path
    else
      p "Sabes que compa, no se pudo borrar. F"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def assign_post
    @post = Post.find(params[:id])
  end
end
