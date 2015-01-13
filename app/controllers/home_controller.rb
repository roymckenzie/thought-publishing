class HomeController < ApplicationController
  def show
    @thoughts = Thought.where("published <= ?", Time.now)
  end
end
