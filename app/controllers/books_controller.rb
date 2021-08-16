class BooksController < ApplicationController




  def create
    @books = Book.all
    @newbook = Book.new(book_params)
    @newbook.user_id = current_user.id
   if @newbook.save
      redirect_to book_path(@book.id),notice: "You have created book successfully."
   else
      @user = current_user
      render :index
   end
  end

  def index

    @newbook = Book.new
    @books = Book.all
    @user = current_user
    @newbook.user_id = current_user.id



  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = User.find(current_user.id)
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
    end

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path ,notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
