class EpisodesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  # before_action :set_podcast
  before_action :set_episode, only: %i[ show edit update destroy ]

  # GET /episodes or /episodes.json
  def index
    @episodes = Episode.all
  end

  # GET /episodes/1 or /episodes/1.json
  def show
    @episodes = @episode.podcast.episodes.includes([episode_thumbnail_attachment: :blob]).reject { |e| e.id == @episode.id }
    # @episodes = Episode.all.includes([episode_thumbnail_attachment: :blob]).reject { |e| e.id == @episode.id }
    # @episodes = @podcast.episodes.order(created_at: :desc).limit(6).reject { |e| e.id == @episode.id }
  end

  # GET /episodes/new
  def new
    @episode = Episode.new
  end

  # GET /episodes/1/edit
  def edit
  end

  # POST /episodes or /episodes.json
  def create
    @episode = Episode.new(episode_params)
    # @episode = @podcast.episodes.build(episode_params)

    respond_to do |format|
      if @episode.save
        format.html { redirect_to episode_url(@episode), notice: "Episode was successfully created." }
        format.json { render :show, status: :created, location: @episode }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /episodes/1 or /episodes/1.json
  def update
    respond_to do |format|
      if @episode.update(episode_params)
        format.html { redirect_to episode_url(@episode), notice: "Episode was successfully updated." }
        format.json { render :show, status: :ok, location: @episode }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /episodes/1 or /episodes/1.json
  def destroy
    @episode.destroy

    respond_to do |format|
      format.html { redirect_to episodes_url, notice: "Episode was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_podcast
      @podcast = Podcast.find(params[:podcast_id])
    end

    def set_episode
      @episode = Episode.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def episode_params
      params.require(:episode).permit(:title, :description, :episode_thumbnail, :mp3_file, :podcast_id)
    end
end
