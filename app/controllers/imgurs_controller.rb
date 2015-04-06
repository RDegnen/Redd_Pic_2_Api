class ImgursController < ApplicationController

  def index
    @response = RestClient.get("https://api.imgur.com/3/gallery/r/pics", Authorization: "Client-ID #{ENV['IMGUR_CLIENT_ID']}")
    render json: @response, status: 200
  end

  def create
    @subreddit = params[:name]
    @sort = params[:sort]
    @window = params[:window]
    @page = params[:page]
    @response = RestClient.get("https://api.imgur.com/3/gallery/r/#{@subreddit}/#{@sort}/#{@window}/#{@page}", Authorization: "Client-ID #{ENV['IMGUR_CLIENT_ID']}")
    render json: @response, status: 200
  end

end
