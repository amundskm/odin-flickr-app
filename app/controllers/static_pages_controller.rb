class StaticPagesController < ApplicationController
  def home
    FlickRaw.api_key = ENV["flickr_key"]
    FlickRaw.shared_secret = ENV["flickr_secret"]
    flickr = FlickRaw::Flickr.new
    flickr_id =  params[:user_id]
    begin
      @photos = flickr.people.getPublicPhotos(user_id: flickr_id)
    rescue
      flash.now[:warning] = "User not found"
    end
  end

end
