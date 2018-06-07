class PlayupController < ApplicationController

  def create
    quote = PlayupCrawlerService.new
    sleep 2
    quote.run
    if quote.valid
      render json: quote.captured_quote
    else
      render json: {message: quote.errors[:user_message]}, status: 400
    end
  end
end
