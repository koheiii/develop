class LivesController < ApplicationController
  def index
    @lives = Live.all
  end
end
