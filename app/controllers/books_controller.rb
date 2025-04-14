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
      # redirect_to book_params(@book.user_id)
      redirect_to users_path
    else
      render :index
    end
  end

  def edit
  end

  private 
  
  def post_book_params
    params.require(:book).permit(:title, :body)
  end
end
