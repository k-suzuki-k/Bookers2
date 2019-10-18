class BooksController < ApplicationController

	before_action :correct_user, only: [:edit, :update]
	def correct_user
		@book = Book.find(params[:id])
		@user = User.find_by(id:@book.user_id)
		@user_chk = current_user
		unless @user == @user_chk
			redirect_to books_path
		end
	end

	def create
		@book = current_user.books.new(book_params)

		if @book.save
			redirect_to book_path(@book), notice:"You have creatad book successfully."
		else
			@user = User.find_by(id:@book.user_id)
			@books = Book.all
			render action: :index
		end
	end

	def index
		@book = Book.new
		@books = Book.all
		@user = current_user
	end

	def show
		@book = Book.new
		@book_detail = Book.find(params[:id])
		@user = User.find_by(id:@book_detail.user_id)
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])

		if @book.update(book_params)
			redirect_to book_path(@book.id), notice:"You have updated book successfully."
		else
			render :edit
		end
	end

	def destroy
		book = Book.find(params[:id])
		book.destroy
		redirect_to books_path
	end

	private
	def book_params
		params.require(:book).permit(:title,:body,:user_id)
	end
end
