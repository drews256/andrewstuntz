class GitFirstTimersController < ApplicationController
  before_action :set_git_first_timer, only: [:show, :edit, :update, :destroy]

  def index
    octokit_client = Octokit::Client.new
    @first_timers_only_search_items = octokit_client.search_issues(q='is:open label:first-timers-only', {page: 1, per_page: 100})[:items]
    html_renderer = Redcarpet::Render::HTML.new(render_options = {:no_images => true})
    @markdown_renderer = Redcarpet::Markdown.new(html_renderer, extensions = {})
  end

  def show
  end

  def new
    @git_first_timer = GitFirstTimer.new
  end

  def edit
  end

  def create
    @git_first_timer = GitFirstTimer.new(git_first_timer_params)

    respond_to do |format|
      if @git_first_timer.save
        format.html { redirect_to @git_first_timer, notice: 'Git first timer was successfully created.' }
        format.json { render :show, status: :created, location: @git_first_timer }
      else
        format.html { render :new }
        format.json { render json: @git_first_timer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @git_first_timer.update(git_first_timer_params)
        format.html { redirect_to @git_first_timer, notice: 'Git first timer was successfully updated.' }
        format.json { render :show, status: :ok, location: @git_first_timer }
      else
        format.html { render :edit }
        format.json { render json: @git_first_timer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @git_first_timer.destroy
    respond_to do |format|
      format.html { redirect_to git_first_timers_url, notice: 'Git first timer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_git_first_timer
      @git_first_timer = GitFirstTimer.find(params[:id])
    end

    def git_first_timer_params
      params.fetch(:git_first_timer, {})
    end
end
