class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @users = User.all
  end

  def edit
  end
end
