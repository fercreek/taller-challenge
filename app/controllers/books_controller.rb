class BooksController < ApplicationController
  before_action :set_book, only: %i[ show update destroy ]

  # GET /books
  def index
    # To optimize index, I add pagination like pagy or kaminary, and ransack gem for search
    # If we have n + 1 query issue, using includes but the related models
    @books = Book.all

    render json: @books
  end

  # GET /books/1
  def show
    render json: @book
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # POST /books/:id/reserve
  def reserve
    @book = Book.find(params[:id])

    # If we have many book, status we can handle this in a better way
    # getting better error and translates if is necesary
    if @book.reserved?
      render json: { error: "Book is already reserved" }, status: :unprocessable_entity
      return
    end

    @book.status = :reserved
    @book.user_email = params[:user_email]

    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.expect(book: [ :title ])
    end
end
