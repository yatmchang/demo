class CommentsController < ApplicationController

  def create
    @comment     = Comment.new comment_params
    @snap        = Snap.find params[:snap_id]
    @comment.snap = @snap

    respond_to do |format|

      if @comment.save
        format.html {redirect_to snap_path(@snap), notice: "comment created!" }
        format.js {render :create_success}
      else
        format.html {render "/snaps/show"}
        format.js {render :create_failure}
      end

    end
  end

  def destroy
    snap = Snap.find params[:snap_id]
    @comment   = Comment.find params[:id]
    @comment.destroy

    respond_to do |format|
      format.html {redirect_to snap_path(snap), notice: "comment deleted"}
      format.js { render }
    end
  end

private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
