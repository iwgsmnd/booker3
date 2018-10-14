class BooksController < ApplicationController
  # def new
  #   @book = Book.new
  # end

  def create
    book = Book.new(book_params)
    if book.save
      flash[:success]='successfully'
      redirect_to book_path(book.id)
    else
      flash[:denger]= 'erorr'
    end
  end

  def index
    @books = Book.all
    @book = Book.new

  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


   private
   def book_params
     params.require(:book).permit(:title,:body,)
   end

end
