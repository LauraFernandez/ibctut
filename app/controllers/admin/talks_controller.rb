class Admin::TalksController < ApplicationController
 # before_filter :require_user, :only=>[:new,:edit,:create,:update,:destroy,:comment]
   before_filter :require_admin_user
 # before_filter :get_event,:only=>[:show,:create]

#  def get_event
#    @event=Event.find(params[:event_id]) unless params[:event_id].nil?
#  end
#  # GET /talks
#  # GET /talks.xml
#  def index
#    @talks = Talk.all
#
#    respond_to do |format|
#      format.html # index.html.erb
#      format.xml  { render :xml => @talks }
#    end
#  end

  # GET /talks/1
  # GET /talks/1.xml
  def show
    @talk = Talk.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @talk }
    end
  end

  # GET /talks/new
  # GET /talks/new.xml
  def new
    @talk = Talk.new
    # @event = Event.find(params[:event_id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @talk }
    end
  end

  # GET /talks/1/edit
  def edit
    @talk = Talk.find(params[:id])
  end

  # POST /talks
  # POST /talks.xml
  def create
    @talk = Talk.new(params[:talk])
    #@event=Event.find(params[:event_id])
    @ids=params[:ids]
    @ids.each do |id|
      #  s=Speaker.find_by_id(id)
      #  puts s.name
      @talk.speakers<<Speaker.find_by_id(id)
      # @talk.talkspeakers<<
    end

    respond_to do |format|
      if @talk.save
         #format.html { redirect_to(event_talk_path(@event,@talk), :notice => "Talk was successfully created.") }
        format.html { redirect_to(talk_path(@talk), :notice => "Talk was successfully created.") }
        format.xml  { render :xml => @talk, :status => :created, :location => @talk }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @talk.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /talks/1
  # PUT /talks/1.xml
  def update
    @talk = Talk.find(params[:id])

    respond_to do |format|
      if @talk.update_attributes(params[:talk])
        format.html { redirect_to(@talk, :notice => 'Talk was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @talk.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /talks/1
  # DELETE /talks/1.xml
#  def destroy
#    @talk = Talk.find(params[:id])
#    @talk.destroy
#
#    respond_to do |format|
#      format.html { redirect_to(talks_url) }
#      format.xml  { head :ok }
#    end
#  end

#  def comment
#
#    @talk = Talk.find(params[:format])
#    comment = Comment.new(params[:comment])
#    @talk.add_comment comment
#    comment.save!
#
#    #Commentmailer.deliver_comment(comment)
#    flash[:notice] = "Comentario añadido con éxito"
#    redirect_to :action => 'show', :id=>@talk.id
#  end
end
