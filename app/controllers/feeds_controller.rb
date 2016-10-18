class FeedsController < ApplicationController
  def index
    @feeds = Feed.all
  end

  def new
    @feed = Feed.new
  end
  def create
    @feed = Feed.new feed_params
    respond_to do |format|
      if @feed.save
        format.html { redirect_to feeds_path, notice: 'Your feed was successfully created.' }
        format.json { render :index, status: :ok, location: @feed }
      else
        format.html { render :new }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @feed = Feed.find(params[:id])
  end
  def update
    @feed = Feed.find(params[:id])
    respond_to do |format|
      if @feed.update feed_params
        format.html { redirect_to feeds_path, notice: 'Your feed was successfully updated.' }
        format.json { render :index, status: :ok, location: @feed }
      else
        format.html { render :edit }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def feed_params
    params.require(:feed).permit(:email, :first_name, :last_name, :ip, :category)
  end
end
