class ThoughtsController < ApplicationController
  before_filter :authenticate_user!, except: [:show]
  before_action :get_thought, only: [:edit, :show, :destroy, :unpublish, :publish, :trash, :restore, :detach_link]

  def index
    @thoughts = Thought.search(params[:trash])
    @active_count = Thought.where(trash: false).count
    @trash_count = Thought.where(trash: true).count
  end

  def new
    @thought = Thought.new
    @thought.build_link
  end

  def create
    @thought = Thought.new(thought_params)
    
    publishMsg = ""
    if params[:publish]
      @thought.published = Time.now
      publishMsg = " and published"
    end

    check_link

    if @thought.save
      flash[:success] = "Thought was successfully created#{publishMsg}."
      redirect_to edit_thought_path(@thought)
    else
      flash[:warning] = "There was a problem, please try again."
      render action: 'new'
    end
  end

  def update
    if params[:preview]
      @thought = Thought.new(thought_params)
      @thought.link = Link.find_by(id: Thought.friendly.find(params[:id]).link)
      render action: 'edit'
    else
      @thought = Thought.friendly.find(params[:id])
      check_link
      if @thought.update(thought_params)
        flash[:success] = "Thought was successfully updated."
        redirect_to edit_thought_path(@thought)
      else
        flash[:warning] = "There was a problem, please try again."
        render action: 'edit'
      end
    end
  end

  def show
  end

  def edit
    @thought.build_link if @thought.link == nil
  end

  def trash
    @thought.trash = true
    @thought.published = nil
    if @thought.save
      flash[:success] = "Thought was successfully trashed."
      redirect_to thoughts_path
    else
      flash[:warning] = "There was a problem, please try again."
      render action: 'edit'
    end
  end

  def restore
    @thought.trash = false
    @thought.published = nil
    if @thought.save
      flash[:success] = "Thought was successfully restored."
      redirect_to edit_thought_path(@thought)
    else
      flash[:warning] = "There was a problem, please try again."
      render action: 'edit'
    end
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

  def detach_link
    @thought.link = nil

    if @thought.save
      # flash[:success] = "Thought was successfully restored."
      redirect_to edit_thought_path(@thought)
    else
      # flash[:warning] = "There was a problem, please try again."
      render action: 'edit'
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
    @thought = Thought.friendly.find(params[:id])
  end

  def thought_params
    params.require(:thought).permit!
  end

  def check_link
    if params[:thought][:link_attributes] != nil
      link = params[:thought][:link_attributes][:url]
      if Link.exists?( :url => link )
        @thought.link = nil
        @thought.link = Link.find_by(url: link)
      end
    end
  end

end
