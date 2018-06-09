class ToppagesController < ApplicationController
  def index
    if logged_in?
      @articles = current_user.articles
    end
  end
end