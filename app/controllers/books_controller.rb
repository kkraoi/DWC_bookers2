class BooksController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(post_book_params)
    @book.user_id = current_user.id

    if @book.save
      redirect_to book_path(@book.id)
    else
      @user = @book.user
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
  end

  private 
  
  def post_book_params
    params.require(:book).permit(:title, :body)
  end
end
