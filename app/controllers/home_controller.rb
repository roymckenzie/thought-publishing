class HomeController < ApplicationController
  def show
    @thoughts = Thought.where("published <= ?", Time.now).order(published: :desc)
  end
end
