class ImgursController < ApplicationController

  def index
    subreddit_array =['pics', 'earthporn', 'historyporn', 'food', 'aww', 'wallpapers', 'carporn', 'space', 'sports']
    @rand_sub = subreddit_array[rand(subreddit_array.length)]
    @response = RestClient.get("https://api.imgur.com/3/gallery/r/#{@rand_sub}", Authorization: "Client-ID #{ENV['IMGUR_CLIENT_ID']}")
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

# Attempt at caching, didn't work to well with the different API calls
# images = Rails.cache.read("images")
    # if images
    #   render json: images, status: 200
    # else

    # Rails.cache.write("images", @response)
