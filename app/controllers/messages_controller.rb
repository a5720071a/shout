class MessagesController < ApplicationController
  before_action :require_user
  def index
    @messages = Message.all
    @message = Message.new
  end
  def create
    @message = @current_user.messages.create(message_params)
    redirect_to root_path
  end
  private
  def message_params
    params.require(:message).permit(:content)
  end
end
