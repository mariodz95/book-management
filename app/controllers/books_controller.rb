class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  before_action :authenticate_user!, only: [:new]
  # GET /books or /books.json
  def index
    if params[:search]
      @books = Book.search(params[:search]).page(params[:page]).per(10).order("created_at DESC")
    else
      @books = Book.page(params[:page]).per(10).order('created_at DESC')
    end
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  def take_book
    book = Book.find(params[:id])
    book.update(:status => 'unavailable')
    book.update(:amount => book.amount - 1)
    @book = Book.find(params[:id])

    today = DateTime.now

    BookReservation.create(user_id: current_user.id, book_id: book.id, reservationNumber: rand(10 ** 10).to_s, start: today, end: today + 14 )

    redirect_to(@book)
  end  

   # POST /books or /books.json
   def create
    @book = Book.new(book_params)
    @book.bookNumber = rand(10 ** 10)
    @book.status = 'available'

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:name, :author, :pages, :description, :languange, :publisher, :bookNumber)
    end
end
