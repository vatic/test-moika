class Admin::MessagesController < AdminController
  before_action :set_message, only: [:show, :destroy]

  def index
  end

  def show
  end

  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to admin_users_path, notice: t('notice.messages.create.success') }
        format.json { render action: 'show', status: :created, location: @message }
      else
        format.html { render action: 'new' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private
  
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(
        :sender_id,
        :receiver_id,
        :car_wash_id,
        :subject, 
        :body, 
        :read_at
      )
    end
end
