class ToppagesController < ApplicationController
  def index
    if logged_in?
      @articles = current_team.articles
    end
  end
end