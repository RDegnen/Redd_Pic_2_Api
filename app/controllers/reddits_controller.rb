class RedditsController < ApplicationController

  def index
    @response = RestClient.get("http://www.reddit.com/r/pics/hot.json")
    render json: @response, status: 200
  end

  def create
    @request = params[:name]
    @response = RestClient.get("http://www.reddit.com/r/#{@request}/hot.json?limit=100")
    render json: @response, status: 200
  end

end
