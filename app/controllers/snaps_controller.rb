class SnapsController < ApplicationController
  before_action :find_snap, only: [:show, :destroy, :like, :dislike]
  # before_action :authenticate_user!, except: [:index, :show]

  def new
    @snap = Snap.new
  end

  def create
    @snap = Snap.new snap_params
    if @snap.save
      redirect_to snap_path(@snap), notice: "Changes Saved!"
    else
      redirect_to new_snap_path(current_user), alert: "Unable To Save"
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @snap }
      format.xml  { render xml:  @snap }
    end
  end

  def index
    @snaps = Snap.order(created_at: :desc)
    respond_to do |format|
      format.html
      format.json { render json: @snaps }
    end
  end

  def destroy
    @snap.destroy
    redirect_to snaps_path, notice: "Snap deleted"
  end

  def like
    if @snap.like_count == nil
      @snap.like_count = 1
    else
      @snap.like_count += 1
    end
    @snap.save
    redirect_to snap_path(@snap), notice: "Changes Saved!"
  end

  def dislike
    if @snap.dislike_count == nil
      @snap.dislike_count = 1
    else
      @snap.dislike_count += 1
    end
    @snap.save
    redirect_to snap_path(@snap), notice: "Changes Saved!"
  end

private

  def snap_params
    params.require(:snap).permit(:picture, :title, :description, :price, :picture_crop_x, :picture_crop_y, :picture_crop_w, :picture_crop_h)
  end

  def find_snap
    @snap = Snap.find params[:id]
  end
end
