class MessagesController < ApplicationController
  def index
    @message = Message.new
    #テンプレートファイルをレンダリング（描画）
  end
end
