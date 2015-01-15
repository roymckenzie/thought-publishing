class ThoughtsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :edit]
  before_action :get_thought, only: [:show, :edit, :update, :destroy, :unpublish, :publish]

  def index
    @thoughts = Thought.all.order(published: :desc)
  end

  def new
    @thought = Thought.new
  end

  def create
    @thought = Thought.new(thought_params)
    
    publishMsg = ""
    if params[:publish]
      @thought.published = Time.now
      publishMsg = " and published"
    end

    if @thought.save
      flash[:success] = "Thought was successfully created#{publishMsg}."
      redirect_to edit_thought_path(@thought)
    else
      flash[:warning] = "There was a problem, please try again."
      render action: 'new'
    end
  end

  def update
    if @thought.update(thought_params)
      flash[:success] = "Thought was successfully updated."
      redirect_to edit_thought_path(@thought)
    else
      flash[:warning] = "There was a problem, please try again."
      render action: 'edit'
    end
  end

  def show
  end

  def edit
  end

  def unpublish
    @thought.published = nil

    if @thought.save
      flash[:warning] = "Thought was unpublished."
      if view_context.get_refer_action == "edit"
        redirect_to edit_thought_path(@thought)
      else
        redirect_to thoughts_path
      end
    else
      flash[:warning] = "There was a problem, please try again."
      render action: 'index'
    end
  end

  def publish
    @thought.published = Time.now

    if @thought.save
      flash[:success] = "Thought was published."
      if view_context.get_refer_action == "edit"
        redirect_to edit_thought_path(@thought)
      else
        redirect_to thoughts_path
      end
    else
      flash[:warning] = "There was a problem, please try again."
      render action: 'index'
    end
  end

  def destroy
    @thought.destroy
    flash[:success] = "Thought was successfully destroyed."
    redirect_to thoughts_path
  end

  private

  def get_thought
    @thought = Thought.find(params[:id])
  end

  def thought_params
    params.require(:thought).permit!
  end
end
