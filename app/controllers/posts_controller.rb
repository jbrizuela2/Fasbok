class PostsController < ApplicationController
  before_action :assign_post, only: [:show, :edit, :update, :destroy]
  before_action :ensure_user_signed, only: [:new, :create, :edit, :update, :destroy]
  before_action :user_has_permission, only: [:edit, :update, :destroy]

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
    params.require(:post).permit(:title, :content).merge(user: current_user)
  end

  def assign_post
    @post = Post.find(params[:id])
  end

  def ensure_user_signed
    return if user_signed_in?

    redirect_to posts_path
  end

  def user_has_permission
    return if @post.user == current_user

    redirect_to posts_path
  end
end
