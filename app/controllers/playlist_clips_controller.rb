class PlaylistClipsController < ApplicationController
  # GET /playlist_clips
  # GET /playlist_clips.xml
  def index
    @playlist_clips = PlaylistClip.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @playlist_clips }
    end
  end

  # GET /playlist_clips/1
  # GET /playlist_clips/1.xml
  def show
    @playlist_clip = PlaylistClip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @playlist_clip }
    end
  end

  # GET /playlist_clips/new
  # GET /playlist_clips/new.xml
  def new
    @playlist_clip = PlaylistClip.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @playlist_clip }
    end
  end

  # GET /playlist_clips/1/edit
  def edit
    @playlist_clip = PlaylistClip.find(params[:id])
  end

  # POST /playlist_clips
  # POST /playlist_clips.xml
  def create
    @playlist_clip = PlaylistClip.new(params[:playlist_clip])

    respond_to do |format|
      if @playlist_clip.save
        flash[:notice] = 'PlaylistClip was successfully created.'
        format.html { redirect_to(@playlist_clip) }
        format.xml  { render :xml => @playlist_clip, :status => :created, :location => @playlist_clip }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @playlist_clip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /playlist_clips/1
  # PUT /playlist_clips/1.xml
  def update
    @playlist_clip = PlaylistClip.find(params[:id])

    respond_to do |format|
      if @playlist_clip.update_attributes(params[:playlist_clip])
        flash[:notice] = 'PlaylistClip was successfully updated.'
        format.html { redirect_to(@playlist_clip) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @playlist_clip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /playlist_clips/1
  # DELETE /playlist_clips/1.xml
  def destroy
    @playlist_clip = PlaylistClip.find(params[:id])
    @playlist_clip.destroy

    respond_to do |format|
      format.html { redirect_to(playlist_clips_url) }
      format.xml  { head :ok }
    end
  end
end
