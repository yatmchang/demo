class SnapsController < ApplicationController
  before_action :find_snap, only: [:show, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

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
  end

  def index
    @snaps = Snap.order(created_at: :desc)
  end

  def destroy
    @snap.destroy
    redirect_to snaps_path, notice: "Snap deleted"
  end

private

  def snap_params
    params.require(:snap).permit(:picture, :title, :description, :price, :picture_crop_x, :picture_crop_y, :picture_crop_w, :picture_crop_h)
  end

  def find_snap
    @snap = Snap.find params[:id]
  end
end
