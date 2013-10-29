class CommentsController < ApplicationController

  def index
    @car_wash = CarWash.find(params[:car_wash_id])
    @new_comment = @car_wash.comments.build
    @comments = @car_wash.comments
  end

  def create
    @car_wash = CarWash.find(params[:car_wash_id])
    @comment = @car_wash.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to car_wash_comment_path(@car_wash, @comment), notice: 'Comment was successfully created.' }
        format.js   {}
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  private
    def set_comment
      @comment= Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(
        :name,
        :car_wash_id,
        :text
      ) 
    end
end
