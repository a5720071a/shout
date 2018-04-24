class MessagesController < ApplicationController
  before_action :require_user
  def index
    @messages = Message.all.reverse
    @message = Message.new
  end
  def create
    @message = @current_user.messages.new(message_params)
    if @message.save
      ActionCable.server.broadcast "messages", message: render_message(@message)
    end
    redirect_to root_path
  end
  private
  def message_params
    params.require(:message).permit(:content)
  end
   def render_message(message)
    ApplicationController.renderer.render partial: "messages/message", locals: {message: message}
  end
end
