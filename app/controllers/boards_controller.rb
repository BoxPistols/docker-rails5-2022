class BoardsController < ApplicationController
  def index
    @board = Board.all
  end

  def new
    @board = Board.new
  end

  def show
    @board = Board.find(params[:id])
  end

  def create
    Board.create(board_params)
    # redirect_to, board_path
  end

  private

  def board_params
    params.require(:board).permit(:name, :title, :body)
  end

end