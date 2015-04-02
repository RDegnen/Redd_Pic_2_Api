class ImgursController < ApplicationController

  def index
    # # parse the params hash
    # { "subreddit" => "nakedladytees" }
    # params["subreddit"] # => nakedladytees
    @response = RestClient.get("https://api.imgur.com/3/gallery/r/#{@request}", Authorization: "Client-ID #{ENV['IMGUR_CLIENT_ID']}")
    render json: @response, status: 200
  end

  def create
    @request = params[:name]
  end

end
