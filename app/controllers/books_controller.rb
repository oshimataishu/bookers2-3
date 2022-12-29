class BooksController < ApplicationController
  def create
    @new_book = Book.new(books_params)
    @new_book.user_id = current_user.id
    if @new_book.save
      redirect_to book_path(@new_book.id)
    else
      @books = Book.all
      render :'index'
    end
  end

  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
  end

  def index
    @new_book = Book.new
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(books_params)
      redirect_to book_path(@book.id)
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def books_params
    params.require(:book).permit(:title, :body)
  end
end
