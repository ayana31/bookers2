class BooksController < ApplicationController
   before_action :authenticate_user! ,except: [:top, :about]
   before_action :correct_user, only: [:edit, :update]

  def top
  end

  def about
  end

  def show
  	@book = Book.new
  	@book_show = Book.find(params[:id])
    @user = @book_show.user

  end

  def index
  	@books = Book.all
    @user = current_user
    @book = Book.new
  end

  def new
  	@book = Book.new
  	@books = Book.all
  end

  def create
  	@book = Book.new(book_params)
  	@user = current_user
  	@book.user_id = @user.id
  	if @book.save
      flash[:success] = 'Successfully.'
  	  redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
  	if book.update(book_params)
      flash[:success] = 'Successfully'
  	redirect_to book_path(book.id)
    else
      render :books
    end
  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
  	redirect_to books_path
  end

  private
  def book_params
  	  params.require(:book).permit(:title, :body, :id)
  end
  def correct_user
    @book = Book.find(params[:id])
    if @book.user.id != current_user.id
    redirect_to book_path(@book.id)
  end
  end


end
