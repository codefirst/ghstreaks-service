require 'githubstats'
require 'pp'

class StreaksController < ApplicationController
  def index
    render json: get_streaks(params[:user])
  end

  private
  def get_streaks(username)
    stats = GithubStats.new(username)

    {
      current_streaks: stats.streak.count,
      data: stats.data.to_h
    }
  rescue
    {
      current_streaks: 0,
      data: []
    }
  end
end
