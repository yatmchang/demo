class Api::V1::SnapsController < ApplicationController
  before_action :find_snap, only: [:show, :destroy]
  skip_before_filter :verify_authenticity_token
  # before_action :authenticate_user!, except: [:index, :show]

  def new
    @snap = Snap.new
  end

  def create
    @snap = Snap.new snap_params

    respond_to do |format|
      @snap.save
      # byebug
      format.json {render :json}
      #  => @post, status: :created
    end
  end

  def show
  end

  def index
    @snaps = Snap.order(created_at: :desc)
    respond_to do |format|
      format.html
      format.json { render json: @snaps }
      format.xml  { render xml:  @snaps }
    end
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
