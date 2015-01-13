class ThoughtsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :edit]
  before_action :get_thought, only: [:show, :edit, :update, :destroy]

  def index
    @thoughts = Thought.where("published <= ?", Time.now)
  end

  def new
    @thought = Thought.new
  end

  def create
    @thought = Thought.new(thought_params)

    if @thought.save
      flash[:success] = "Thought was successfully created."
      redirect_to @thought
    else
      flash[:warning] = "There was a problem, please try again."
      render action: 'new'
    end
  end

  def update
    if @thought.update(thought_params)
      flash[:success] = "Thought was successfully updated."
      redirect_to @thought
    else
      flash[:warning] = "There was a problem, please try again."
      render action: 'edit'
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @thought.destroy
    flash[:success] = "Thought was successfully destroyed."
  end

  private

  def get_thought
    @thought = Thought.find(params[:id])
  end

  def thought_params
    params.require(:thought).permit!
  end
end
