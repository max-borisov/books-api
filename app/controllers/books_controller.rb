class BooksController < ApplicationController
  before_action :validate_token
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    books = Book.all
    render json:books, status: :ok
  end

  def create
    book = Book.new(book_params)
    return render json: book, status: :created if book.save
    render json: book.errors.messages, status: :bad_request
  end

  def update
    book = Book.find(params[:id])
    return render json: book, status: :ok if book.update(book_params)
    render json: book.errors.messages, status: :bad_request
  end

  def destroy
    book = Book.find(params[:id])
    return render json: book, status: :ok if book.destroy
    head :internal_server_error
  end

  private

  def validate_token
    return head :unauthorized unless valid_token?
  end

  def valid_token?
    params[:token] == ENV.fetch('APP_REQUEST_TOKEN')
  end

  def book_params
    params.require(:book).permit(:title, :description)
  end

  def not_found
    return head :not_found
  end
end
