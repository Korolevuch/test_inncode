class FeedsController < ApplicationController
  
  def create
    feed = Feed.create(query_params['feed'].merge!(is_active: true))
    redirect_to action: "show", id: feed.id
  end
  
  def update
    feed = Feed.update(query_params)
    redirect_to action: "show", id: feed.id
  end
  
  def index 
    @feeds = Feed.all
  end
  
  def show
    @feed = Feed.find_by_id(query_params[:id])
  end
  
  def new 
    @feed = Feed.new
  end
  
  def edit
    @feed = Feed.find_by_id(query_params[:id])
  end
  
  private
  
  def query_params
    params.permit(
      :id, 
      feed: [:link]
    )
  end
end