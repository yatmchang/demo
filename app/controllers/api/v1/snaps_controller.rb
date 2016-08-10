class Api::V1::SnapsController < ApplicationController
  before_action :find_snap, only: [:show, :destroy, :like, :dislike]
  skip_before_filter :verify_authenticity_token
  # before_action :authenticate_user!, except: [:index, :show]

  def new
    @snap = Snap.new
  end

  def create
    @snap = Snap.new snap_params
    @snap.save
    respond_to do |format|
      format.json {render :json}
      #  => @post, status: :created
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
      format.xml  { render xml:  @snaps }
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
    respond_to do |format|
      # format.html
      format.json {render :json}
    end
  end


  def dislike
    if @snap.dislike_count == nil
      @snap.dislike_count = 1
    else
      @snap.dislike_count += 1
    end
    @snap.save
    respond_to do |format|
      # format.html
      format.json {render :json}
    end
  end

private

  def snap_params
    params.require(:snap).permit(:picture, :title, :description, :price, :picture_crop_x, :picture_crop_y, :picture_crop_w, :picture_crop_h)
  end

  def find_snap
    @snap = Snap.find params[:id]
  end
end
