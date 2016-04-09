class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update, :destroy]
  def index
    @message = Message.new
    #テンプレートファイルをレンダリング（描画）
    #メッセージをすべて取得する
    @messages = Message.all
  end
  
  def edit
  end
  
  def update
    if @message.update(message_params)
      #　保存に成功した場合はトップページへリダイレクト
      redirect_to root_path , notice: 'メッセージを編集しました'
    else
      #　保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path , notice: 'メッセージを保存しました'
    else
      #メッセージが保存出来なかった時
      @messages = Message.all
      #@message の中にエラーメッセージが入っている
      flash.now[:alert] = "メッセージの保存に失敗しました"
      render 'index'
    end
    
    def destroy
      @message.destroy
      redirect_to root_path, notice: 'メッセージを削除しました'
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:name, :body)
  end
   ##ここまで
  def set_message
    @message = Message.find(params[:id])
  end
  
  def destroy
    @message.destroy
    redirect_to root_path, notice: 'メッセージを削除しました'
  end
end
