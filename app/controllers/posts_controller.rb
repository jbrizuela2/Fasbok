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
      flash[:notice] = "Se ha creado el post correctamente"
      redirect_to post_path(@post)
    else
      flash[:alert] = "No se ha podido crear el post"
      render :new
    end
  end

  # Editar
  def edit
  end

  # Update
  def update
    if @post.update(post_params)
      flash[:notice] = "Post actualizado correctamente"
      redirect_to post_path(@post)
    else
      flash[:alert] = "El post no se ha podido actualizar"
      render :edit
    end
  end

  # Destroy
  def destroy
    if @post.destroy
      flash[:notice] = "#{@post.title} eliminado correctamente"
      redirect_to posts_path
    else
      flash[:alert] = "Sabes que compa, no se pudo borrar. F"
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
