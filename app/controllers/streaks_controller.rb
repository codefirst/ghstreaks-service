require 'githubstats'
require 'pp'

class StreaksController < ApplicationController
  def index
    render json: get_streaks(params[:user])
  end

  private
  def get_streaks(username)
    stats = GithubStats.new(username)

    data = stats.to_h

    {
      current_streaks: stats.streak.count,
      current_week: (Date.today.beginning_of_week..Date.today.end_of_week).map {|day| data[day] }
    }
  end

end
