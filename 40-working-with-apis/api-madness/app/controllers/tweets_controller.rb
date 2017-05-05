class TweetsController < ApplicationController
  def index
    @tweets = Tweet.search('biggie smalls')
  end
end
