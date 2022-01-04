class BoardsController < ApplicationController
  def index
    @board = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    Board.create(board_params)
    redirect_to board_path
  end

  def show
    @board = Board.find(params[:id])
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    board = Board.find(params[:id])
    board.update(board_params)

    redirect_to board_path(board)
  end

  private

  def board_params
    params.require(:board).permit(:name, :title, :body)
  end

end