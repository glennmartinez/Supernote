class NotesController < ApplicationController
  # GET /notes
  # GET /notes.json
  before_filter :authenticate_user!
  def index
    #@notes = Note.all
    @notes = Note.find(:all, :conditions => { :user_id => current_user.id})

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notes }
    end
  end

  def backbone
    #@notes = Note.all
    @notes = Note.find(:all, :conditions => { :user_id => current_user.id})

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notes }
    end
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    @note = Note.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @note }
    end
  end

  # GET /notes/new
  # GET /notes/new.json
  def new
    @note = Note.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @note }
    end
  end

  # GET /notes/1/edit
  def edit
    @note = Note.find(params[:id])
  end

  # POST /notes
  # POST /notes.json
  def create

    note_params = params
    #note_params.delete('action')
    #note_params.delete('controller')
    note_params['user_id'] = current_user.id  

    #@note = Note.new(params[:note])
    @note = Note.new(note_params[:note])
    @note.user_id = current_user.id

    respond_to do |format|
      if @note.save
        #format.html { redirect_to @note, notice: 'Note was successfully created.' }
        #format.json { render json: @note, status: :created, location: @note }
        format.html { redirect_to(@note, :notice => 'Note was successfully created.') }
        format.json  { render :json => @note, :status => :created, :location => @note }
      else
        #format.html { render action: "new" }
        #format.json { render json: @note.errors, status: :unprocessable_entity }
        format.html { render :action => "new" }
        format.json  { render :json => @note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /notes/1
  # PUT /notes/1.json
  def update
    @note = Note.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to notes_url }
      format.json { render json: @note }
    end
  end
end
