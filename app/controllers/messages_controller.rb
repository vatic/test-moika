class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :update]
  respond_to :js, :html
  def index
    @car_wash = CarWash.find(params[:car_wash_id])
      respond_to do |format|
        format.js { 
          if params[:on_cpanel] == '0'
            @messages = @car_wash.messages.where('id > ?', params[:after].to_i)
            render "index"
          else
            render "on_cpanel"
          end
        }
        format.html {
          @messages = @car_wash.messages
          @unread_messages_count = @car_wash.unread_messages_count
        }
      end
  end

  def show
  end

  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render json: @message.car_wash.messages.ids}
      else
        format.html { render action: 'edit' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:sender_id, :receiver_id, :car_wash_id, :subject, :body, :read)
    end
end
