class BooksController < ApplicationController

	def new

	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@book.save
		redirect_to book_path(@book)
	end

	def index
	  @book = Book.new
	end

	def show
		@book = Book.find(params[:id])
	end

	def edit
		@book = Book.find(params[:id])
	end
	def destroy
	end

	def update

	end

	private
	def book_params
		params.require(:book).permit(:title,:body,:user_id)
	end
end
