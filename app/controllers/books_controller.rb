class BooksController < ApplicationController
  def new

  end

  def create
    @book = Book.new(book_params)
    @book.user_id=current_user.id

    if @book.save!
      redirect_to book_path(@book.id)
    else
      @books =Book.all
      render :index
    end
  end
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  def index

    @books=Book.all
    @book = Book.new
  end

  def show
    @book=Book.find(params[:id])


  
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book =Book.find(params[:id])
    @book.destroy
    redirect_to books_path

  end


  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :image, :body)
  end



end
