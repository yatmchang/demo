class SnapsController < ApplicationController
  before_action :find_snap, only: [:update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def new
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
    
  end

  def destroy
  end

private

  def snap_params
    params.require(:snap).permit(:picture, :title, :description, :price)
  end

  def find_snap
    @snap = Snap.find params[:id]
  end
end
