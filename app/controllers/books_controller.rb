class BooksController < ApplicationController
  def index
    @available_at = Time.now
    #@books = Book.all
    #@books = Book.order(:title).page(params[:page])
     @books = Book.includes(:reviews).order(:title).page(params[:page])
  end

before_action :set_book, only: [ :show, :edit, :update, :destroy ]

  def show
    #@book = Book.find(params[:id])
  end

def new
    @book = Book.new
  end

def create
  @book = Book.new(book_params)
  if @book.save
    #redirect_to @book
    redirect_to @book, notice: "#{@book.title} was created!"
    else
      render :new
    end
end

def edit
  #@book = Book.find(params[:id])
end

def update
  #@book = Book.find(params[:id])
  #@book.update(book_params)
  #redirect_to @book
  if @book.update(book_params)
    #redirect_to @book
    redirect_to @book, notice: "#{@book.title} was updated!"
  else
      render :edit
  end
end

def destroy
  #@book = Book.find(params[:id])
  @book.destroy
  redirect_to books_url
end

private
def book_params
  params.require(:book).permit(:title, :author, :pages, :price)
end

def set_book
  @book = Book.find(params[:id])
end

end
