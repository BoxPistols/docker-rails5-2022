class BoardsController < ApplicationController
=begin
  @board = Viewのあるオブジェクト、モデルを格納
  board = Viewの必要がないオブジェクト、モデルに何らかの作用を用いて格納
=end

  def index
    # モデルの全件取得
    @board = Board.all
  end

  def new
    # モデルの追加
    @board = Board.new
  end

  def create
    # createメソッドで正常にデータが格納されると、データ格納されてboardオブジェクトが返る
    board = Board.create(board_params)
    # IDが自動で付与され、IDにリダイレクトされる
    # redirect_to board_path(board)
    redirect_to board
  end

  def show
    # findメソッドでそのIDの詳細を表示
    @board = Board.find(params[:id])
  end

  def edit
    # findメソッドでそのIDの詳細を編集
    @board = Board.find(params[:id])
  end

  def update
    # 編集に伴うデータの更新、開いているURLがターゲット、オブジェクトに格納
    board = Board.find(params[:id])
    # オブジェクトにupdateメソッドの実行、データに格納
    board.update(board_params)
    #　編集したIDのページにリダイレクト。パス(そのオブジェクト)
    # redirect_to board_path(board)
    redirect_to board
  end

  def destroy
    # 対象のオブジェクト、データの抽出
    board = Board.find(params[:id])
    # 対象のオブジェクトからそのデータを削除する
    board.delete
    # そこにパスは無いので、TOPにリダイレクト
    redirect_to boards_path
  end

  #　セキュアな実装
  private

  def board_params
    params.require(:board).permit(:name, :title, :body)
  end

end